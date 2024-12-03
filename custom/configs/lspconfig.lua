local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = {
  "html",
  "cssls",
  "clangd",
  "eslint",
  "gopls",
  "jdtls",
  "astro",
  "grammarly",
  "marksman",
  "emmet_ls",
  "yamlls",
  "jsonls",
  "dockerls",
  "lua_ls",
}

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature

-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = util.rust_pattern("Cargo.toml"),
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       }
--     }
--   }
-- })

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css" },
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "js" },
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
}
