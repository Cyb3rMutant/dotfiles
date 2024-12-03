---@type MappingsTable
local M = {}

-- <C> -> Ctrl
-- <leader> -> Space
-- <A> -> alt
-- <S> -> shift
-- <M> -> meta (cmd key on mac)
-- <D> -> super (windows key on windows)
-- <kPoint> -> Keypad Point (.)
-- <kEqual> -> Keypad Equal (=)
-- <kPlus> -> Keypad Plus (+)
-- <kMinus> -> Keypad Minus (-)

M.disabled = {
  n = {
    -- toggle
    ["<C-n>"] = "",
    -- focus
    ["<leader>e"] = "",
  },

}

M.dap = {
  n = {
    ['<leader>db'] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dup.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar",
    },
  },
}

M.Rust = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require("crates").upgrade_all_crates()
      end,
      "update_crates",
    },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  }

}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<C-Up>"] ={ ":resize -2<CR>", "Resize Up" },
    ["<C-Down>"] ={ ":resize +2<CR>", "Resize Down" },
    ["<C-Left>"] ={ ":vertical resize -2<CR>", "Resize Left" },
    ["<C-Right>"] ={ ":vertical resize +2<CR>", "Resize Right" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    ["kj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}

M.disabled = {
  n = {
    ["<leader>b"] = "",
  },
}

M.rest = {
  n = {
    ["<leader>rs"] = {
      function()
        require("rest-nvim").run()
      end,
      "RestNvim Run",
    },
  },
}

M.folder = {
  n = {
    ["<leader>c"] = { "zc", "Close folder" },
    ["<leader>a"] = { "zo", "Open folder" },
    ["<leader>p"] = {
      function()
        require("fold-preview").toggle_preview()
      end,
      "Open folder recursively",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modesx
  n = {
    ["<A-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
    ["<D-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<A-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.development = {
  n = {
    ["<leader>bc"] = {
      function()
        require("nvim-biscuits").toggle_biscuits()
      end,
      "Toggle context",
    },
    ["<A-p>"] = { "<cmd>Colortils picker<CR>", "Delete word" },
  },
}

M.text = {
  n = {
    ["<leader>cc"] = { "<cmd> ColorcolumnToggle <CR>", "Toggle ColorColumn display" },
    ["<A-d>"] = { "<cmd>:MCstart<CR>", "Multi cursor" },

    -- ["<leader>rn"] = { "<cmd> :lua require('renamer').rename()<CR>", "Rename" },
    ["<leader>ra"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>rn"] = {
      function()
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      -- ":IncRename "
      "Rename",
      opts = { expr = true },
    },
  },

  v = {
    ["<C-Up>"] = { ":m'<-2<CR>gv=gv", "Move selection up", opts = { silent = true } },
    ["<C-Down>"] = { ":m'>+1<CR>gv=gv", "Move selection down", opts = { silent = true } },
    ["<Home>"] = { "gg", "Home" },
    ["<End>"] = { "G", "End" },
    -- Indent backward/forward:
    ["<"] = { "<gv", "Ident backward", opts = { silent = false } },
    [">"] = { ">gv", "Ident forward", opts = { silent = false } },
  },
}

M.diagnostics = {
  n = {
    ["<leader>tw"] = { "<cmd>TroubleToggle<cr>", "Toggle warnings" },
    ["<leader>td"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<cr>", "Todo/Fix/Fixme" },
    ["<leader>ft"] = { "<cmd>:TodoTelescope<cr>", "Telescope TODO" },
    ["<Leader>ll"] = {
      function()
        require("lsp_lines").toggle()
      end,
      "Toggle lsp_lines",
    },
  },
}

M.minimap = {
  n = {
    ["<leader>mm"] = {
      function()
        require("codewindow").toggle_minimap()
      end,
      "Toggle minimap",
    },
  },
}

M.docker = {
  n = {
    ["<leader>ld"] = { "<cmd> LazyDocker <CR>", "Open LazyDocker" },
  },
}

M.session = {
  n = {
    ["<leader>ss"] = {
      function()
        require("auto-session.session-lens").search_session()
      end,
      "List session",
    },
    ["<leader>sd"] = { "<cmd>SessionDelete<CR>", "Delete Session" },
  },
}

return M
