local v = require("land.defaults")
local lib = require("land.lib")

-- quickshell draws the bar, the wallpaper and the screenshot overlay (~/.config/hypr/quickshell)
lib.exec_once(v.SCRIPTS .. "/bar.sh")

-- quickshell watches this file to know when to show the bar
local BARFILE = os.getenv("XDG_RUNTIME_DIR") .. "/zephyr-bar"

local function write(s)
	local f = io.open(BARFILE, "w")
	if f then
		f:write(s)
		f:close()
	end
end

-- bar is hidden and only shows while super is held, like i3's hide mode
local SUPER = { [133] = true, [134] = true } -- xkb keycodes of Super_L / Super_R
write("0")
hl.on("input.keyboard.key", function(keycode, _, state)
	if SUPER[keycode] and state ~= 2 then -- 2 is key repeat
		write(state == 1 and "1" or "0")
	end
end)
