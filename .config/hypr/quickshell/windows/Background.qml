import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "root:/components" as Components

PanelWindow {
	id: background
    
	exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Background

    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    // the hyprland monitor this window is on, so each screen follows its own workspace
    property var monitor: Hyprland.monitorFor(screen)

	Components.BackgroundImage { monitor: background.monitor }

    Components.WorkspaceLine { monitor: background.monitor }
}