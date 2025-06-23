local options = {
	ensure_installed = {
		-- mine
		"pyright",
		"mypy",
		"black",
		"bash-language-server",
		"sqlls",
		"marksman",
		"stylua",

		-- web dev stuff
		"prettierd",
		"eslint-lsp",
		"css-lsp",
		"html-lsp",
		"djlint",
		"htmlhint",
		"curlylint",

		-- Json
		"jsonlint",
		"json-lsp",

		"dockerfile-language-server",
		"yaml-language-server",
	},

	PATH = "skip",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},

	max_concurrent_installers = 10,
}

return options
