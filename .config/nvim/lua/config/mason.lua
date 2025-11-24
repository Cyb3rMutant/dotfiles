local options = {
	ensure_installed = {
		-- mine
		"pyright",
		"mypy",
		"black",
		"isort",
		"bash-language-server",
		"shfmt",
		"sqlls",
		"markdownlint",
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
		"phpactor",
		"phpcbf",
		"phpstan",

		-- Json
		"jsonlint",
		"json-lsp",

		"dockerfile-language-server",
		"yaml-language-server",
	},

	PATH = "skip",
}

return options
