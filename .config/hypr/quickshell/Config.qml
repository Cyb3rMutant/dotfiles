pragma Singleton

import QtQuick
import Quickshell

import "root:/"



Singleton {

    function alpha(color, alpha) {
        return Qt.rgba(color.r, color.g, color.b, alpha)
    }

    // bar, colours are i3bar's defaults
    readonly property int barHeight : 15
    readonly property int barWidth : 2000
    readonly property string barFont : "Comic Code Ligatures"
    readonly property int barFontSize : 12
    readonly property color barBackground : "#000000"
    readonly property color barText : "#ffffff"
    readonly property color barDivider : "#717171"
    readonly property color barUrgent : "#ff5555"
    readonly property string battery : "BAT0" // folder in /sys/class/power_supply
    readonly property var workspaceColors : ({
        focused:  { border: "#4c7899", background: "#285577", text: "#ffffff" },
        active:   { border: "#333333", background: "#5f676a", text: "#ffffff" },
        inactive: { border: "#333333", background: "#222222", text: "#888888" },
        urgent:   { border: "#2f343a", background: "#900000", text: "#ffffff" }
    })

    // workspace
    readonly property int workspaceGap : 20

    readonly property bool autoWorkspaceFontSize : true
    property int workspaceFontSize : 20

    // clock

    readonly property bool clockFixedWidth : false
    readonly property bool clockShowSeconds : true
    readonly property bool clockNoBackgroundForZero : true
    readonly property bool clock24Hour : false

    readonly property int clockTextShadowWidth : 0
    readonly property int clockBoxShadowWidth : 0
    readonly property int clockSeperatorWidth : 10

    readonly property color clockColor : Colors.primary
    readonly property color clockBoxShadow : Colors.background
    readonly property color clockSeperator1Color : alpha(Colors.surface_bright,0.8)
    readonly property color clockSeperator2Color : alpha(Colors.surface,0.8)

    //

    property int workspaceBottomMargin : 10

    readonly property url wallpaperImage : "root:/assets/hill.mp4"
    // the video doubles app launch times on this laptop, so a still frame of it is the default
    readonly property bool wallpaperAnimated : false
    readonly property url wallpaperStill : "root:/assets/hill.jpg"
    readonly property bool darkMode : true
}
