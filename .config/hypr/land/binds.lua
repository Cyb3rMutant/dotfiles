local v = require("land.defaults")
local M1 = "SUPER"
local exec = hl.dsp.exec_cmd

-- workspace
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(M1 .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(M1 .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(M1 .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(M1 .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- hyprland
hl.bind(M1 .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(M1 .. " + M", hl.dsp.exit())
hl.bind(M1 .. " + E", exec("kitty ranger"))
hl.bind(M1 .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(M1 .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(M1 .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(M1 .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(M1 .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(M1 .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(M1 .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(M1 .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(M1 .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(M1 .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(M1 .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(M1 .. " + SHIFT + LEFT", hl.dsp.window.move({ direction = "left" }))
hl.bind(M1 .. " + SHIFT + DOWN", hl.dsp.window.move({ direction = "down" }))
hl.bind(M1 .. " + SHIFT + UP", hl.dsp.window.move({ direction = "up" }))
hl.bind(M1 .. " + SHIFT + RIGHT", hl.dsp.window.move({ direction = "right" }))
hl.bind(M1 .. " + f", hl.dsp.window.fullscreen())

hl.bind(M1 .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(M1 .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- util
hl.bind(M1 .. " + D", exec("wofi --show drun"))
hl.bind(M1 .. " + C", exec("cliphist list | wofi --dmenu --prompt clipboard | cliphist decode | wl-copy"))
-- wifi and vpn menu, config in ~/.config/networkmanager-dmenu/config.ini
hl.bind(M1 .. " + N", exec("networkmanager_dmenu"))
-- pick the output / input audio device
hl.bind(M1 .. " + A", exec(v.SCRIPTS .. "/audio.sh"))

-- screenshots: print selects an area (with the rope animation), ctrl takes the whole
-- screen you're on, shift saves to ~/Pictures/Screenshots instead of the clipboard
local ss = v.SCRIPTS .. "/ss.sh"
hl.bind("Print", exec(ss .. " region clip"))
hl.bind("SHIFT + Print", exec(ss .. " region file"))
hl.bind("CTRL + Print", exec(ss .. " full clip"))
hl.bind("CTRL + SHIFT + Print", exec(ss .. " full file"))
hl.bind(M1 .. " + RETURN", exec("kitty"))

hl.bind(M1 .. " + SHIFT + X", exec(v.LOCK))
