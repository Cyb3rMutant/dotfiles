local autocmd = vim.api.nvim_create_autocmd

autocmd("TermClose", {
	callback = function()
		vim.cmd("close")
	end,
})

autocmd("BufEnter", {
	pattern = { "*.md", "*.tex" },
	group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true }),
	command = "setlocal wrap",
})
-- codal/micro:bit headers are C++ but use the .h extension, which nvim calls C
vim.filetype.add({
	extension = {
		h = function(_, bufnr)
			for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, 200, false)) do
				if line:find("^%s*class%s") or line:find("^%s*namespace%s") or line:find("^%s*template%s*<") then
					return "cpp"
				end
			end
			return "c"
		end,
	},
})

autocmd("FileType", {
	pattern = { "python", "lua", "c", "cpp" },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
