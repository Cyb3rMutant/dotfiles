local options = {
	ensure_installed = {
		-- mine
		"cpptools",
		"cpplint",
		"clangd",
		"clang-format",
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
		"lua-language-server",
		"typescript-language-server",
		"vale",
		"tex-fmt",
		"ltex-ls-plus",

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
		"tailwindcss-language-server",

		-- Json
		"jsonlint",
		"json-lsp",

		"dockerfile-language-server",
		"yaml-language-server",
	},

	PATH = "skip",
}

return options
