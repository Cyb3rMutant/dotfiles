local options = {
  ensure_installed = {
    -- mine
    "pyright",
    "mypy",
    "ruff",
    "black",
    "cmake-language-server",
    "bash-language-server",
    "sqlls",
    "codespell",
    "marksman",

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
    "htmlhint",
    "curlylint",

    -- Json
    "jsonlint",
    "json-lsp",

    "dockerfile-language-server",
    "yaml-language-server",
  },

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return options
