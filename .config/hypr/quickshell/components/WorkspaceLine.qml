import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick.Layouts

import "root:/"

Rectangle {
    property var monitor: Hyprland.focusedMonitor

    height: 100
    width: 5
    color: Colors.tertiary

    anchors {
        left: parent.left
    }

    y: ((monitor?.activeWorkspace?.id ?? 1) - 1) * (parent.height - height) / 9

    Behavior on y {
        NumberAnimation {
            duration: 570

            easing.bezierCurve: [0.23,1,0.61,1,1,1]
            easing.type: Easing.BezierSpline
        }
    }
}