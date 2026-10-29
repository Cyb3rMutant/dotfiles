import QtQuick
// import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "root:/"
import "./components" as Components
import "./windows" as Windows


Rectangle {
    anchors.fill: parent

    // one background and one bar per screen
    Variants {
        model: Quickshell.screens

        Windows.Background {
            required property var modelData
            screen: modelData
        }
    }

    Variants {
        model: Quickshell.screens

        Windows.Bar {
            required property var modelData
            screen: modelData
            shown: barState.shown
        }
    }

    // shown while super is held, written by theme.lua
    FileView {
        id: barState
        property bool shown: false
        path: Quickshell.env("XDG_RUNTIME_DIR") + "/zephyr-bar"
        watchChanges: true
        onFileChanged: reload()
        onLoaded: shown = text().trim() == "1"
    }

    SocketServer {
        id: socket
        property variant geom: null

        Component.onDestruction: {
            if (socket.geom != null) {
                socket.geom.destroy()
            }
        }

        Component.onCompleted: {
            // var geomComponent = Qt.createComponent("root:/windows/Geom.qml")
            //             if (geomComponent.status == Component.Ready) {
            //                 socket.geom = geomComponent.createObject(root)
            //                 if (socket.geom == null) {
            //                     console.log("Error creating geom")
            //                 }
            //             } else {
            //                 console.log("Error loading geom")
            //                 console.log(geomComponent.errorString())
            //             }
        }

        active: true
        path: "/tmp/quickshell_zephyr.sock"
        handler: Socket {
            id: handler
            onConnectedChanged: {
                console.log(connected ? "new connection!" : "connection dropped!")
            }
            parser: SplitParser {
                onRead: msg => {
                    if (msg.startsWith("geom ")) {
                        if (socket.geom != null) {
                            socket.geom.destroy()
                        }
                        var geomComponent = Qt.createComponent("root:/windows/Geom.qml")
                        if (geomComponent.status == Component.Ready) {
                            // on the screen you're on, told where to send the screenshot
                            var focused = Quickshell.screens.find(s => s.name == Hyprland.focusedMonitor?.name)
                            socket.geom = geomComponent.createObject(root, {
                                dest: msg.split(" ")[1],
                                screen: focused ?? Quickshell.screens[0]
                            })
                            if (socket.geom == null) {
                                console.log("Error creating geom")
                            }
                        } else {
                            console.log("Error loading geom")
                            console.log(geomComponent.errorString())
                        }
                    }

                    if (msg == "exitgeom") {
                        socket.geom.destroy()
                    }
                }
            }
        }
    }
}
