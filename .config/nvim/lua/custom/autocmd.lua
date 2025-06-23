vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.tex" },
  group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true }),
  command = "setlocal wrap",
})
