import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.Pipewire

import "root:/"

// i3bar style: workspaces of this screen on the left, status blocks on the right
PanelWindow {
    id: bar

    implicitHeight: Config.barHeight
    // the background is a Rectangle below rather than the window colour,
    // so it fades out with everything else when the bar is hidden
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: Config.barBackground
    }

    // overlay is above fullscreen windows, top isn't
    WlrLayershell.layer: WlrLayer.Overlay
    // float over windows instead of reserving space, so showing it doesn't resize everything
    exclusionMode: ExclusionMode.Ignore

    anchors {
        left: true
        right: true
        top: true
    }

    // set from Main.qml. the window stays mapped and only goes invisible and click-through,
    // creating it on every super press made it slow to show up
    property bool shown: false
    property var monitor: Hyprland.monitorFor(screen)

    visible: true
    contentItem.opacity: shown ? 1 : 0
    mask: Region { item: bar.shown ? bar.contentItem : null }

    onShownChanged: {
        if (shown) {
            SystemStats.refreshLayout();
            SystemStats.refreshWifi();
        }
    }

    PwObjectTracker { objects: [Pipewire.defaultAudioSink] }

    component Label: Text {
        color: Config.barText
        font.family: Config.barFont
        font.pixelSize: Config.barFontSize
        anchors.verticalCenter: parent.verticalCenter
    }

    component Divider: Label {
        text: "|"
        color: Config.barDivider
    }

    // workspaces that exist on this screen
    Row {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 2

        Repeater {
            model: Hyprland.workspaces.values
                .filter(ws => ws.id > 0 && ws.monitor === bar.monitor)
                .sort((a, b) => a.id - b.id)

            delegate: Rectangle {
                required property var modelData
                // focused: the workspace you're on. active: shown on this screen, but another screen has focus
                property string kind: modelData.focused ? "focused" : modelData.active ? "active" : modelData.urgent ? "urgent" : "inactive"

                width: Math.max(height, label.implicitWidth + 14)
                height: parent.height
                color: Config.workspaceColors[kind].background
                border.color: Config.workspaceColors[kind].border
                border.width: 1

                Label {
                    id: label
                    anchors.centerIn: parent
                    text: modelData.name
                    color: Config.workspaceColors[kind].text
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: modelData.activate()
                }
            }
        }
    }

    Row {
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 8

        Label {
            text: SystemStats.wifi ? "WIFI " + SystemStats.wifi + " " + SystemStats.wifiSignal + "%" : "WIFI down"
            color: SystemStats.wifi ? Config.barText : Config.barUrgent
        }
        Divider {}

        Label {
            property var audio: Pipewire.defaultAudioSink?.audio
            text: !audio ? "VOL -" : audio.muted ? "VOL muted" : "VOL " + Math.round(audio.volume * 100) + "%"
        }
        Divider {}

        Label {
            visible: SystemStats.battery >= 0
            text: "BAT " + SystemStats.battery + "%" + (SystemStats.charging ? "+" : "")
            color: !SystemStats.charging && SystemStats.battery <= 15 ? Config.barUrgent : Config.barText
        }
        Divider { visible: SystemStats.battery >= 0 }

        Label { text: "CPU " + SystemStats.cpu + "%" }
        Divider {}

        Label { text: "RAM " + SystemStats.ramUsedGb.toFixed(1) + "G" }
        Divider {}

        Label { text: SystemStats.layout }
        Divider {}

        Label {
            id: clock
            // date '+%a %d %b %H:%M:%S'
            function update() { text = Qt.formatDateTime(new Date(), "ddd dd MMM HH:mm:ss") }

            Timer {
                interval: 1000
                // only ticks while you can see it, and catches up straight away on show
                running: bar.shown
                repeat: true
                triggeredOnStart: true
                onTriggered: clock.update()
            }
        }
    }
}
