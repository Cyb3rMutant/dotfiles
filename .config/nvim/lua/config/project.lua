local options = {
	active = true,
	on_config_done = nil,
	manual_mode = false,
	lsp = {
		enabled = true,
	},
	patterns = {
		".git",
		"Makefile",
		"package.json",
		"lua",
		".env",
		".venv",
	},
	show_hidden = false,
	silent_chdir = true,
	datapath = vim.fn.stdpath("data"),
}

return options
