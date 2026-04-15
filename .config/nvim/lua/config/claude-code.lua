return {
	window = {
		position = "float",
		float = {
			width = "80%",
			height = "80%",
			row = "center",
			col = "center",
			relative = "editor",
			border = "rounded",
		},
	},
	keymaps = {
		toggle = {
			normal = false,
			terminal = false,
			variants = {
				continue = "<A-c>",
				verbose = "<leader>cV",
			},
		},
		window_navigation = true,
		scrolling = true,
	},
}
