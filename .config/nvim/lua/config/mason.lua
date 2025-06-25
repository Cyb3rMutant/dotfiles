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
}

return options
