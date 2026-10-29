-- apps like kitty ask to be maximized when they open, which made new terminals
-- cover the whole workspace instead of tiling. ignore those requests
hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "spotify",
	match = { title = "^(Spotify)$" },
	float = true,
})
