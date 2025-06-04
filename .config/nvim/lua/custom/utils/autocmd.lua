local autocmd = vim.api.nvim_create_autocmd
local settings = require("custom.chadrc").settings

-- set wrap for markdown
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.tex" },
  group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true }),
  command = "setlocal wrap",
})
-- Fix semantic tokens for lsp
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
