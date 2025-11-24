local options = {
	active = true,
	on_config_done = nil,
	manual_mode = false,
	use_lsp = true,
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
	ignore_lsp = {},
	datapath = vim.fn.stdpath("data"),
}

return options
