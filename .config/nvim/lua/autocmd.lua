local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = { "*.md", "*.tex" },
	group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true }),
	command = "setlocal wrap",
})
autocmd("FileType", {
	pattern = { "*.py", "*.lua" },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
