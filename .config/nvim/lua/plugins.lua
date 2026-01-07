return {
	{
		"amitds1997/remote-nvim.nvim",
		version = "*", -- Pin to GitHub releases
		dependencies = {
			"nvim-lua/plenary.nvim", -- For standard functions
			"MunifTanjim/nui.nvim", -- To build the plugin UI
			"nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
		},
		config = true,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = ":call mkdp#util#install()",
	},
	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
	},
	{
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup()
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("config.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- lsp stuff
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("config.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)

			-- install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		"neovim/nvim-lspconfig",
	},

	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {

			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require("config.luasnip")
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("config.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	-- file managing , picker etc
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = function()
			return require("config.nvimtree")
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require("config.telescope")
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},

	-- mine

	{
		"RRethy/vim-illuminate",
		event = { "CursorHold", "CursorHoldI" },
		config = function() end,
	},
	{
		"DrKJeff16/project.nvim",
		lazy = false,
		opts = function()
			return require("config.project")
		end,
		config = function(_, opts)
			require("project").setup(opts)
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("config.conform"),
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("config.nvim-lint")
		end,
	},
	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		config = function(_, opts)
			require("which-key").setup(opts)
		end,
	},
}
