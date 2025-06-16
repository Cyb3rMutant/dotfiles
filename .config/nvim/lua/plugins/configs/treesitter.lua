local options = {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
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

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
    disable = {
      "python",
    },
  },

  auto_install = true,
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

return options
