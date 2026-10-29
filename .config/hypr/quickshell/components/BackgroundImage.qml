import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtMultimedia
import QtQuick.Shapes

import "root:/"

Rectangle {
    id: bg

    // set by windows/Background.qml
    property var monitor: Hyprland.focusedMonitor
    property int workspaceId: monitor?.activeWorkspace?.id ?? 1

    anchors.fill: parent

    color: Colors.surface ?? "black"

    // scaled to the screen's height, the extra width slides as you change workspace
    Loader {
        id: wallpaper
        sourceComponent: Config.wallpaperAnimated ? videoWallpaper : stillWallpaper

        height: bg.height
        width: bg.height * (item ? item.sourceAspect : 2)

        property int extraWidth: wallpaper.width - bg.width
        property int wallpaper_x: - (bg.workspaceId - 1) * extraWidth / 9

        x: wallpaper_x

        Behavior on x {
            NumberAnimation {
                duration: 570

                easing.bezierCurve: [0.23,1,0.61,1,1,1]
                easing.type: Easing.BezierSpline
            }
        }
    }

    Component {
        id: stillWallpaper

        Image {
            property real sourceAspect: implicitHeight > 0 ? implicitWidth / implicitHeight : 2

            source: Config.wallpaperStill
            fillMode: Image.Stretch
            asynchronous: true
        }
    }

    // decodes the video once per screen, which costs a lot of cpu
    Component {
        id: videoWallpaper

        Video {
            property real sourceAspect: {
                var res = metaData.value(27);
                return res && res.height ? res.width / res.height : 2;
            }

            source: Config.wallpaperImage
            muted: true

            autoPlay: true
            loops: MediaPlayer.Infinite

            fillMode : VideoOutput.Stretch
        }
    }

}
