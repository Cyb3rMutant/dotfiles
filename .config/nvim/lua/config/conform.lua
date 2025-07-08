local opts = {
	formatters_by_ft = {
		python = { "black" },
		lua = { "stylua" },
		javascript = { "prettierd" },
		htmldjango = { "djlint" },
		css = { "prettierd" },
		bash = { "shfmt" },
		markdown = { "markdownlint" },
		php = { "phpcbf" },
	},
	formatters = {
		djlint = {
			prepend_args = { "--indent", "2" },
		},
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
}
return opts
