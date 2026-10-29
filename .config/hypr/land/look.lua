hl.config({
	decoration = {
		rounding = 20,
	},

	general = {
		border_size = 2,
		gaps_in = 5,
		gaps_out = 10,
	},

	animations = {
		enabled = true,
	},
})

-- hl.curve("overshoot", { type = "bezier", points = { {0.23, 1.23}, {0.61, 1.08} } })
-- hl.animation({ leaf = "windows",    enabled = true, speed = 2,  bezier = "overshoot", style = "popin" })
-- hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "overshoot" })
-- hl.animation({ leaf = "fade",       enabled = true, speed = 10, bezier = "overshoot" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "overshoot", style = "slide" })
