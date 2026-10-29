
pragma Singleton

import QtQuick
import Quickshell.Io
import Quickshell

import "root:/"

Item {
    Process {
        running: true
        command: ["hyprctl","eval","hl.config({ general = { col = { active_border = 'rgb("+Colors.tertiary.toString().replace("#","")+")' } } })"]
    }

    Process {
        running: true
        command: ["hyprctl","eval","hl.config({ general = { col = { inactive_border = 'rgb("+Colors.primary.toString().replace("#","")+")' } } })"]
    }
}

