import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "root:/components" as Components
import "root:/"

PanelWindow {
	id: geom
    
	exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay

    // "clip" or "file", see ss.sh
    property string dest: "clip"

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    Item {
        focus: true
        Keys.onEscapePressed: geom.destroy()
    }

    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onPressed : (mouse) => {
            if (mouse.button == Qt.RightButton) {
                geom.destroy()
                return
            }
            geomRect.visible = true
            geomRect.anchorX = mouse.x
            geomRect.anchorY = mouse.y

            geomRect.anchor1X = mouse.x
            geomRect.anchor1Y = mouse.y
            geomRect.anchor2X = mouse.x
            geomRect.anchor2Y = mouse.y
        }
        onPositionChanged : (mouse) => {
            geomRect.anchor1X = Math.min(geomRect.anchorX, mouse.x)
            geomRect.anchor1Y = Math.min(geomRect.anchorY, mouse.y)

            geomRect.anchor2X = Math.max(geomRect.anchorX, mouse.x)
            geomRect.anchor2Y = Math.max(geomRect.anchorY, mouse.y)
        }
        onReleased : (mouse) => {
            geomRect.visible = false
            // a click without a drag cancels
            if (geomRect.anchorDx > 4 && geomRect.anchorDy > 4) {
                // grim wants global coordinates, these are relative to this screen
                var area = `${geom.screen.x + geomRect.anchor1X},${geom.screen.y + geomRect.anchor1Y} ${geomRect.anchorDx}x${geomRect.anchorDy}`
                var script = Qt.resolvedUrl("root:/../scripts/ss.sh").toString().replace("file://", "")
                // the sleep lets this overlay disappear before the screenshot is taken
                Quickshell.execDetached(["sh", "-c", 'sleep 0.2; exec "$0" geometry "$1" "$2"', script, area, geom.dest])
            }
            geom.destroy()
        }
    }

    Rectangle {
        id: geomRect
        anchors.fill: parent

        color: "transparent"
        // visible: false
        property int anchorX: 0
        property int anchorY: 0

        property int anchor1X: parent.width/2
        property int anchor1Y: parent.height/2
        property int anchor2X: parent.width/2
        property int anchor2Y: parent.height/2


        property int anchorDx: anchor2X - anchor1X
        property int anchorDy: anchor2Y - anchor1Y

        property int borderWidth: 6

        onAnchor1XChanged: {
            canvas.requestPaint()
        }

        onAnchor1YChanged: {
            canvas.requestPaint()
        }

        onAnchor2XChanged: {
            canvas.requestPaint()
        }

        onAnchor2YChanged: {
            canvas.requestPaint()
        }


        Canvas {
            id: canvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                ctx.fillStyle = Colors.surface
                ctx.globalAlpha = 0.8
                //bg 
                ctx.fillRect(0, 0, parent.width, parent.height)
                ctx.globalAlpha = 1
                ctx.fillStyle = Colors.primary
                ctx.fillRect(geomRect.anchor1X-geomRect.borderWidth, geomRect.anchor1Y-geomRect.borderWidth, geomRect.anchorDx+geomRect.borderWidth*2 , geomRect.anchorDy+geomRect.borderWidth*2)

                //corner circles
                ctx.beginPath()
                ctx.arc(geomRect.anchor1X, geomRect.anchor1Y, geomRect.borderWidth*4, 0, 2 * Math.PI)
                ctx.fill()

                ctx.beginPath()
                ctx.arc(geomRect.anchor2X, geomRect.anchor1Y, geomRect.borderWidth*4, 0, 2 * Math.PI)
                ctx.fill()

                ctx.beginPath()
                ctx.arc(geomRect.anchor1X, geomRect.anchor2Y, geomRect.borderWidth*4, 0, 2 * Math.PI)
                ctx.fill()

                ctx.beginPath()
                ctx.arc(geomRect.anchor2X, geomRect.anchor2Y, geomRect.borderWidth*4, 0, 2 * Math.PI)
                ctx.fill()

                //rect
                ctx.clearRect(geomRect.anchor1X, geomRect.anchor1Y, geomRect.anchorDx , geomRect.anchorDy)
            }
        }

        Rope {
        anchors.fill: parent
        color: "transparent"
        anchorX: 0
        anchorY: 0

        pullX: geomRect.anchor1X
        pullY: geomRect.anchor1Y
    }

    Rope {
        anchors.fill: parent
        color: "transparent"
        anchorX: parent.width
        anchorY: 0

        pullX: geomRect.anchor2X
        pullY: geomRect.anchor1Y
    }

    Rope {
        anchors.fill: parent
        color: "transparent"
        anchorX: 0
        anchorY: parent.height

        pullX: geomRect.anchor1X
        pullY: geomRect.anchor2Y
    }

    Rope {
        anchors.fill: parent
        color: "transparent"
        anchorX: parent.width
        anchorY: parent.height

        pullX: geomRect.anchor2X
        pullY: geomRect.anchor2Y
    }
    }

    
}