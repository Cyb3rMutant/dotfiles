local v = require("land.defaults")
local lib = require("land.lib")

lib.exec_once(v.SCRIPTS .. "/powercheck")
lib.exec_once(v.SCRIPTS .. "/portal.sh")
lib.exec_once("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
lib.exec_once("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

-- night light, wayland's redshift. change it live with: hyprctl hyprsunset temperature 4000
-- (or "hyprctl hyprsunset identity" to turn it off)
lib.exec_once("hyprsunset -t 3000")

-- clipboard history (super+c to pick from it)
lib.exec_once("wl-paste --type text --watch cliphist store")
lib.exec_once("wl-paste --type image --watch cliphist store")

-- banana cursor. it's an xcursor theme, so hyprland and apps pick it up from these
hl.env("XCURSOR_THEME", "Banana")
hl.env("XCURSOR_SIZE", "24")

-- dpms is a lua dispatcher now, so hyprctl dispatch takes lua code
lib.exec(
	string.format(
		[==[pkill swayidle; swayidle -w timeout 300 '%s' timeout 600 'hyprctl dispatch "hl.dsp.dpms({ action = \"off\" })"' resume 'hyprctl dispatch "hl.dsp.dpms({ action = \"on\" })"' before-sleep '%s']==],
		v.LOCK,
		v.LOCK
	)
)

hl.config({
	input = {
		kb_layout = "us,ara",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 1,

		touchpad = {
			drag_lock = true,
			natural_scroll = true,
		},
	},

	xwayland = {
		force_zero_scaling = true,
	},

	misc = {
		disable_hyprland_logo = true,
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
