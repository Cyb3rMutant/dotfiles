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
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		-- cross builds (codal/micro:bit) record arm-none-eabi-g++ in
		-- compile_commands.json; let clangd interrogate that driver for its
		-- system headers instead of falling back to the host ones
		"--query-driver=/usr/bin/arm-none-eabi-*,/usr/bin/gcc,/usr/bin/g++",
		"--background-index",
		"--completion-style=detailed",
		"--header-insertion=never",
		"--function-arg-placeholders",
		"--offset-encoding=utf-16",
	},
	-- used for files the compile database does not cover
	init_options = {
		fallbackFlags = { "-std=c++11" },
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
	"clangd",
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
	"ltex-ls-plus",
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
