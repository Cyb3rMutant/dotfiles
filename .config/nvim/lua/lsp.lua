vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
				unusedLocalExclude = { "_*" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})
vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				extraPaths = { "../frappe" },
				typeCheckingMode = "basic",
				reportUnusedVariable = "warning",
				reportUnusedImport = "warning",
				reportUnusedFunction = "warning",
			},
		},
	},
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"ts_ls",
	"tailwindcss",
	"bashls",
	"html",
	"cssls",
	"sqlls",
	"eslint",
	"marksman",
	"jsonls",
	"dockerls",
	"phpactor",
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
	},

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
	underline = true,
	update_in_insert = false,
})
