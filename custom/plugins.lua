local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  ----------------------------------------- default plugins ------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- {
      --   "jose-elias-alvarez/null-ls.nvim",
      --   config = function()
      --     require "custom.configs.null-ls"
      --   end,
      -- },
      "ray-x/lsp_signature.nvim",
      {
        "folke/neodev.nvim",
        opts = {},
        config = function()
          require("neodev").setup {}
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  ----------------------------------------- override plugins ------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "tom-anders/telescope-vim-bookmarks.nvim",
      "tsakirist/telescope-lazy.nvim",
      "andrewferrier/debugprint.nvim",
      {
        "ThePrimeagen/harpoon",
        cmd = "Harpoon",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "chrisgrieser/nvim-various-textobjs",
    },
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = function()
      return require "custom.configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = overrides.colorizer,
  },
  {
    "hrsh7th/nvim-cmp",
    -- opts = overrides.cmp,
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
    dependencies = {
      -- "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "f3fora/cmp-spell",
      -- "hrsh7th/cmp-vsnip",
      "delphinus/cmp-ctags",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-copilot",
      "ray-x/cmp-treesitter",
      {
        "hrsh7th/cmp-cmdline",
        event = "CmdLineEnter",
      },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {} -- put your options here
        end,
      },
      -- {
      --   "L3MON4D3/LuaSnip",
      --   config = function(_, opts)
      --     require("plugins.configs.others").luasnip(opts) -- from default luasnip conf
      --
      --     local luasnip = require "luasnip"
      --
      --     luasnip.filetype_extend("javascriptreact", { "html" })
      --     require("luasnip/loaders/from_vscode").lazy_load() -- from default luasnip conf
      --   end,
      -- },
    },
  },
  ----------------------------------------- enhance plugins ------------------------------------------
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPost",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "smoka7/multicursors.nvim",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    event = "VeryLazy",
    config = true,
  },
  -- {
  --   "rmagatti/auto-session",
  --   event = "VimEnter",
  --   config = function()
  --     require("auto-session").setup {
  --       log_level = "error",
  --       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --       auto_session_enabled = true,
  --       auto_save_enabled = true,
  --       auto_restore_enabled = true,
  --       auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
  --       session_lens = {
  --         load_on_setup = true,
  --         theme_conf = { border = true },
  --         previewer = true,
  --       },
  --     }
  --   end,
  -- },
  {
    "code-biscuits/nvim-biscuits",
    event = "BufRead",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "custom.configs.biscuits"
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    dependencies = "nvim-treesitter",
    config = function()
      require "custom.configs.illuminate"
    end,
  },
  {
    "barrett-ruth/live-server.nvim",
    cmd = "LiveServerStart",
    build = "yarn global add live-server",
    config = true,
  },
  { "tpope/vim-surround", event = "VeryLazy" },
  {
    "mawkler/modicator.nvim",
    event = "BufWinEnter",
    init = function()
      vim.o.cursorline = true
      -- vim.o.number = true
      vim.o.termguicolors = true
    end,
    config = function()
      require("modicator").setup {
        highlights = {
          defaults = { bold = true },
          -- modes = {
          --   ["i"] = { foreground = colors.insert },
          --   ["s"] = { foreground = colors.select },
          --   ["S"] = { foreground = colors.select },
          --   ["R"] = { foreground = colors.replace },
          --   ["c"] = { foreground = colors.command },
          --   ["v"] = visual_hl,
          --   ["V"] = visual_hl,
          --   ["^V"] = visual_hl,
          -- },
        },
      }
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufReadPost",
    config = function()
      require("virt-column").setup {
        char = "┃",
        -- virtcolumn = "120",
      }
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    config = function()
      require("rest-nvim").setup {
        result_split_horizontal = true,
      }
    end,
  },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   event = { "WinNew" },
  --   config = function()
  --     require("colorful-winsep").setup {
  --       -- highlight for Window separator
  --       highlight = {
  --         bg = "#16161E",
  --         fg = "#1F3442",
  --       },
  --       -- timer refresh rate
  --       interval = 30,
  --       -- This plugin will not be activated for filetype in the following table.
  --       no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
  --       -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
  --       symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
  --       close_event = function()
  --         -- Executed after closing the window separator
  --       end,
  --       create_event = function()
  --         -- Executed after creating the window separator
  --       end,
  --     }
  --   end,
  -- },
  ----------------------------------------- ui plugins ------------------------------------------
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.93,
          width = 150,
          height = 1,
        },
        plugins = {
          options = {
            showcmd = true,
          },
          twilight = { enabled = false },
          gitsigns = { enabled = true },
        },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.todo"
    end,
  },
  {
    "chikko80/error-lens.nvim",
    -- event = "BufRead",
    ft = "go",
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "custom.configs.trouble"
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },
  { "rainbowhxch/beacon.nvim", event = "BufReadPost" },
  -- {
  --   "echasnovski/mini.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("mini.animate").setup {
  --       scroll = {
  --         enable = true,
  --       },
  --     }
  --   end,
  -- },
  {
    "gorbit99/codewindow.nvim",
    event = "VeryLazy",
    config = function()
      require("codewindow").setup {
        show_cursor = false, -- Show the cursor position in the minimap
        window_border = "rounded", -- The border style of the floating window (accepts all usual options)
      }
      -- vim.api.nvim_set_hl(0, 'CodewindowBorder', {fg = '#141423'})
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.hlchunk"
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    init = function()
      vim.g.code_action_menu_show_details = true
      vim.g.code_action_menu_show_diff = true
      vim.g.code_action_menu_show_action_kind = true
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "BrunoKrugel/lazydocker.nvim",
    cmd = "LazyDocker",
  },
  {
    "smjonas/inc-rename.nvim",
    event = "LspAttach",
    config = true,
  },
  {
    "AckslD/muren.nvim",
    cmd = "MurenToggle",
    config = true,
  },
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        event = "BufReadPost",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              -- Segment 1: Add padding
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              {
                text = { " " },
              },
              -- -- Segment 2: Show signs with one character width
              -- {
              --   sign = { name = { ".*" }, maxwidth = 1, colwidth = 1 },
              --   auto = true,
              --   click = "v:lua.ScSa",
              -- },
              -- Segment 3: Show line number
              {
                text = { "", "", builtin.lnumfunc, " " },
                click = "v:lua.ScLa",
                condition = { true, builtin.not_empty },
              },
              -- -- Segment 4: Add padding
              -- {
              --   text = { " " },
              --   hl = "Normal",
              --   condition = { true, builtin.not_empty },
              -- },
            },
          }
        end,
      },
    },
    config = function()
      require("ufo").setup {
        provider_selector = function(_, filetype, buftype)
          return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
            or { "treesitter", "indent" } -- if file opened, try to use treesitter if available
        end,
      }
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.inlayhints"
    end,
  },
  {
    "samodostal/image.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "m00qek/baleia.nvim",
        tag = "v1.3.0",
      },
    },
    config = function()
      require("image").setup {
        render = {
          min_padding = 5,
          show_label = true,
          use_dither = true,
          foreground_color = true,
          background_color = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end,
    init = function()
      if not vim.fn.executable "ascii-image-converter" then
        vim.api.nvim_command 'echo "Command is not executable. snap install ascii-image-converter"'
      end
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    config = function()
      require("diffview").setup {
        enhanced_diff_hl = true,
        view = {
          merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
          },
        },
      }
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup {}
    end,
  },
  {
    "tzachar/highlight-undo.nvim",
    event = "BufReadPost",
    config = function()
      require("highlight-undo").setup {}
    end,
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  {
    "dnlhc/glance.nvim",
    event = "VeryLazy",
    config = function()
      require("glance").setup {
        -- your configuration
      }
    end,
  },
  -- {
  --   "Zeioth/compiler.nvim",
  --   cmd = { "CompilerOpen", "CompilerToggleResults" },
  --   dependencies = {
  --     {
  --       "stevearc/overseer.nvim",
  --       commit = "3047ede61cc1308069ad1184c0d447ebee92d749",
  --       opts = {
  --         task_list = {
  --           direction = "bottom",
  --           min_height = 25,
  --           max_height = 25,
  --           default_detail = 1,
  --           bindings = {
  --             ["q"] = function()
  --               vim.cmd "OverseerClose"
  --             end,
  --           },
  --         },
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("compiler").setup(opts)
  --   end,
  -- },
  ----------------------------------------- language plugins ------------------------------------------
  -- {
  --   "toppair/peek.nvim",
  --   build = "deno task --quiet build:fast",
  --   ft = { "markdown", "vimwiki" },
  --   config = function()
  --     require("peek").setup {
  --       auto_load = true,
  --       syntax = true,
  --       update_on_change = true,
  --       app = "webview",
  --       theme = "dark",
  --       filetype = { "markdown", "vimwiki" },
  --     }
  --   end,
  --   init = function()
  --     vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  --     vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  --   end,
  -- },
  -------------------------------------------- my old plugins ---------------------------------------------
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup( --[[optional config]])
    end,
  },
  {
    "NvChad/nvterm",
    require("nvterm").setup {
      terminals = {
        type_opts = {
          horizontal = { split_ratio = 0.25 },
        },
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependenceis = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "lervag/vimtex",
    lazy = false,
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    opts = function()
      return require "custom.configs.project"
    end,
    config = function(_, opts)
      require("project_nvim").setup(opts)
      -- require("telescope").load_extention("projects")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- build = "cd app && yarn install",
    build = ":call mkdp#util#install()",
  },
  {
    "windwp/nvim-autopairs",
    opts = function()
      return require "custom.configs.autopairs"
    end,
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
  {
    "andweeb/presence.nvim",
    lazy = false,
    config = function()
      require("presence").setup {}
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "utilyre/barbecue.nvim",
    lazy = false,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "stevearc/aerial.nvim",
    "nvim-lspconfig",
    config = function()
      require "custom.plugins.aerial"
    end,
  },
}

return plugins
