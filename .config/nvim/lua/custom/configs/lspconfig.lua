local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = {
  "pyright",
  "ts_ls",
  "tailwindcss",
  "bashls",
  "html",
  "cssls",
  "sqlls",
  -- "clangd",
  "eslint",
  "marksman",
  "jsonls",
  "dockerls",
  "lua_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.clangd.setup {
--   cmd = {
--     "clangd",
--     "--offset-encoding=utf-16",
--   },
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
-- }
--
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.bashls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
-- lspconfig.sqlls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
