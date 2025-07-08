local options = {
	ensure_installed = {
		"vim",
		"lua",
		"vimdoc",
		"bash",
		"json",
		"json5",
		"yaml",
		"dockerfile",
		"regex",

		-- Markdown
		"markdown",
		"markdown_inline",

		-- Web Dev
		"javascript",
		"typescript",
		"tsx",
		"html",
		"astro",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = true,
	},

	auto_install = true,
	playground = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = true,
	},
}

return options
