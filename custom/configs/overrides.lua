local M = {}

M.treesitter = {
  auto_install = true,
  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "json",
    "json5",
    "jq",
    "yaml",
    "java",
    "dockerfile",
    "regex",

    -- Markdown
    "markdown",
    "markdown_inline",
    -- Go Lang
    "go",
    "gomod",
    "gowork",
    "gosum",

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
    "rust-analyzer",
    "pyright",
    "mypy",
    "ruff",
    "black",
    "clangd",
    "clang-format",
    "cmake-language-server",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "eslint-lsp",
    "css-lsp",
    "html-lsp",
    "emmet-ls",

    -- Spell
    "codespell",
    "marksman",
    "grammarly-languageserver",

    -- Json
    "jsonlint",
    "json-lsp",

    "dockerfile-language-server",
    "yaml-language-server",
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = { "node_modules", ".docker", ".git", "yarn.lock", "go.sum", "go.mod", "tags", "mocks" },
  },
  extensions_list = {
    "themes",
    "terms",
    "frecency",
    "undo",
    "vim_bookmarks",
    "harpoon",
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    lazy = {
      show_icon = true,
      mappings = {
        open_in_browser = "<C-o>",
        open_in_file_browser = "<M-b>",
        open_in_find_files = "<C-f>",
        open_in_live_grep = "<C-g>",
        open_plugins_picker = "<C-b>",
        open_lazy_root_find_files = "<C-r>f",
        open_lazy_root_live_grep = "<C-r>g",
      },
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvcheatsheet",
    "lsp-installer",
    "norg",
    "Empty",
    "",
  },
  -- char = "¦",
  -- context_char = "¦",
  buftype_exclude = { "terminal", "nofile" },
  show_end_of_line = true,
  show_foldtext = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  show_current_context = true,
  show_current_context_start = true,
  vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { nocombine = true, fg = "none" }),
  vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { nocombine = false, underline = false, special = "none" }),
}

M.colorizer = {
  user_default_options = {
    names = false,
    RRGGBBAA = true,
    rgb_fn = true,
  },
}

M.cmp = {
  completion = {
    completeopt = "menu,menuone",
    autocomplete = false,
  },
  experimental = {
    ghost_text = {
      hl_group = "Comment",
    },
  },
  mapping = {
    ["<Up>"] = require("cmp").mapping.select_prev_item(),
    ["<Down>"] = require("cmp").mapping.select_next_item(),
    ["<Tab>"] = {},
    ["<CR>"] = require("cmp").mapping {
      i = function(fallback)
        if require("cmp").visible() and require("cmp").get_active_entry() then
          require("cmp").confirm { behavior = require("cmp").ConfirmBehavior.Replace, select = false }
        else
          fallback()
        end
      end,
      s = require("cmp").mapping.confirm { select = true },
      c = require("cmp").mapping.confirm { behavior = require("cmp").ConfirmBehavior.Replace, select = true },
    },
    -- ["<ESC>"] = require("cmp").mapping.close(),
    -- ["<Tab>"] = require("cmp").mapping(function(fallback)
    --   local luasnip = require "luasnip"
    --   local copilot_keys = vim.fn["copilot#Accept"]()
    --   if require("cmp").visible() then
    --     require("cmp").select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif copilot_keys ~= "" and type(copilot_keys) == "string" then
    --     vim.api.nvim_feedkeys(copilot_keys, "i", true)
    --     -- vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
    --   else
    --     fallback()
    --   end
    -- end, {
    --   "i",
    --   "s",
    -- }),
    ["<ESC>"] = require("cmp").mapping(function(fallback)
      if require("cmp").visible() then
        require("cmp").abort()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "crates" },
    { name = "cmp_tabnine" },
    {
      name = "ctags",
      option = {
        executable = "ctags",
        trigger_characters = { "." },
      },
    },
    { name = "path" },
    { name = "treesitter" },
    { name = "nvim_lsp_document_symbol" },
    {
      name = "nvim_lsp",
      keyword_length = 5,
      entry_filter = function(entry, ctx)
        return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
      end,
    },
  },
  -- sorting = {
  --   comparators = {
  --     -- require("cmp").config.compare.recently_used,
  --     -- require("cmp").config.compare.sort_text,
  --     require("cmp").config.compare.exact,
  --     require("cmp").config.compare.score,
  --     require("cmp").config.compare.kind,
  --     require("cmp").config.compare.length,
  --     require("cmp").config.compare.order,
  --   },
  -- },
}

return M
