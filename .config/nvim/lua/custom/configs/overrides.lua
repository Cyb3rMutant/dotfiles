local M = {}

M.treesitter = {
  auto_install = true,
  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "json",
    "json5",
    "yaml",
    "dockerfile",
    "regex",

    -- Markdown
    "markdown",
    "markdown_inline",

    -- Web Dev
    "javascript",
    "typescript",
    "tsx",
    "html",
    "astro",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
  playground = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = 1000,
    query = {
      "rainbow-parens",
      html = "rainbow-tags",
      javascript = "rainbow-tags-react",
      tsx = "rainbow-tags",
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- mine
    "pyright",
    "mypy",
    "ruff",
    "black",
    "clangd",
    "clang-format",
    "cmake-language-server",
    "bash-language-server",
    "sqlls",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "prettierd",
    "eslint-lsp",
    "css-lsp",
    "html-lsp",
    "djlint",

    -- Json
    "jsonlint",
    "json-lsp",

    "dockerfile-language-server",
    "yaml-language-server",
  },
}

return M
