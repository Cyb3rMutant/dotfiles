-- any external screen goes on top, with the laptop centred underneath it.
-- re-runs whenever a screen is plugged in, so no script to run by hand
local LAPTOP = "eDP-1"

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- positions are in scaled pixels, width/height are real pixels
local function logical_size(m)
	return math.floor(m.width / m.scale), math.floor(m.height / m.scale)
end

local function arrange()
	local laptop, external
	for _, m in ipairs(hl.get_monitors()) do
		if m.name == LAPTOP then
			laptop = m
		elseif not external then
			external = m
		end
	end
	-- nothing to arrange with one screen (or under --verify-config, which has none)
	if not laptop or not external then
		return
	end

	local ext_w, ext_h = logical_size(external)
	local lap_w = logical_size(laptop)

	hl.monitor({ output = external.name, mode = "preferred", position = "0x0", scale = external.scale })
	hl.monitor({
		output = LAPTOP,
		mode = "preferred",
		position = math.floor((ext_w - lap_w) / 2) .. "x" .. ext_h,
		scale = laptop.scale,
	})
end

hl.on("hyprland.start", arrange)
hl.on("config.reloaded", arrange)
hl.on("monitor.added", arrange)
