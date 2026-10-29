pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

// cpu, ram, battery and keyboard layout, shared by the bars on every screen
Singleton {
    id: stats

    property int cpu: 0
    property real ramUsedGb: 0
    property int battery: -1 // -1 when there's no battery
    property bool charging: false
    property string layout: ""
    property string wifi: "" // network name, empty when not connected
    property int wifiSignal: 0

    property var lastCpu: null

    FileView { id: procStat; path: "/proc/stat"; blockLoading: true }
    FileView { id: procMem; path: "/proc/meminfo"; blockLoading: true }
    // quickshell's UPower service doesn't see the battery here, so read sysfs directly
    FileView { id: batCapacity; path: "/sys/class/power_supply/" + Config.battery + "/capacity"; blockLoading: true; printErrors: false }
    FileView { id: batStatus; path: "/sys/class/power_supply/" + Config.battery + "/status"; blockLoading: true; printErrors: false }

    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            procStat.reload();
            procMem.reload();
            batCapacity.reload();
            batStatus.reload();

            // first line of /proc/stat: cpu user nice system idle iowait irq softirq steal
            var f = procStat.text().split("\n")[0].trim().split(/\s+/).slice(1, 9).map(Number);
            var idle = f[3] + f[4];
            var total = f.reduce((a, b) => a + b, 0);
            if (stats.lastCpu && total > stats.lastCpu.total)
                stats.cpu = Math.round(100 * (1 - (idle - stats.lastCpu.idle) / (total - stats.lastCpu.total)));
            stats.lastCpu = { total: total, idle: idle };

            var mem = {};
            procMem.text().split("\n").forEach(line => {
                var m = line.match(/^(\w+):\s+(\d+)/);
                if (m)
                    mem[m[1]] = Number(m[2]);
            });
            stats.ramUsedGb = (mem.MemTotal - mem.MemAvailable) / 1048576;

            var cap = parseInt(batCapacity.text());
            stats.battery = isNaN(cap) ? -1 : cap;
            stats.charging = batStatus.text().trim() == "Charging";
        }
    }

    // layout comes from hyprctl, refreshed when it changes and whenever the bar is shown
    Process {
        id: devices
        command: ["hyprctl", "-j", "devices"]
        stdout: StdioCollector {
            onStreamFinished: {
                var kb = JSON.parse(text).keyboards.find(k => k.main);
                if (kb)
                    stats.layout = kb.layout.split(",")[kb.active_layout_index] ?? kb.active_keymap;
            }
        }
    }

    function refreshLayout() {
        devices.running = true;
    }

    // quickshell's networking service doesn't see any devices here, so ask nmcli (~10ms).
    // refreshed when the bar is shown and every 30s
    Process {
        id: nmcli
        command: ["nmcli", "-t", "-f", "ACTIVE,SSID,SIGNAL", "dev", "wifi", "list", "--rescan", "no"]
        stdout: StdioCollector {
            onStreamFinished: {
                // yes:<ssid>:<signal>, colons inside the ssid are escaped as \:
                var line = text.split("\n").find(l => l.startsWith("yes:"));
                if (!line) {
                    stats.wifi = "";
                    return;
                }
                var fields = line.slice(4);
                var cut = fields.lastIndexOf(":");
                stats.wifi = fields.slice(0, cut).replace(/\\:/g, ":");
                stats.wifiSignal = parseInt(fields.slice(cut + 1)) || 0;
            }
        }
    }

    function refreshWifi() {
        nmcli.running = true;
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: stats.refreshWifi()
    }

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name == "activelayout")
                stats.refreshLayout();
        }
    }

    Component.onCompleted: refreshLayout()
}
