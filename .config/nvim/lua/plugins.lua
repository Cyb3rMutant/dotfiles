local gh = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	gh("nvim-lua/plenary.nvim"),
	gh("greggh/claude-code.nvim"),
	gh("ray-x/lsp_signature.nvim"),
	gh("nvim-tree/nvim-web-devicons"),
	gh("neovim/nvim-lspconfig"),
	gh("numToStr/Comment.nvim"),
	gh("RRethy/vim-illuminate"),
	gh("DrKJeff16/project.nvim"),
	gh("stevearc/conform.nvim"),
	gh("mfussenegger/nvim-lint"),
	gh("folke/which-key.nvim"),
	gh("nvim-treesitter/nvim-treesitter"),
	gh("williamboman/mason.nvim"),
	gh("L3MON4D3/LuaSnip"),
	gh("rafamadriz/friendly-snippets"),
	gh("windwp/nvim-autopairs"),
	gh("hrsh7th/nvim-cmp"),
	gh("saadparwaiz1/cmp_luasnip"),
	gh("hrsh7th/cmp-nvim-lua"),
	gh("hrsh7th/cmp-nvim-lsp"),
	gh("hrsh7th/cmp-buffer"),
	gh("hrsh7th/cmp-path"),
	gh("nvim-tree/nvim-tree.lua"),
	gh("nvim-telescope/telescope.nvim"),
})

require("claude-code").setup(require("config.claude-code"))
require("lsp_signature").setup({ bind = true, handler_opts = { border = "rounded" } })
require("nvim-web-devicons").setup()
require("Comment").setup()
require("project").setup(require("config.project"))
require("conform").setup(require("config.conform"))
require("config.nvim-lint")
require("which-key").setup()

require("nvim-treesitter").install({
	"vim",
	"python",
	"lua",
	"vimdoc",
	"bash",
	"json",
	"json5",
	"yaml",
	"dockerfile",
	"regex",
	"markdown",
	"markdown_inline",
	"javascript",
	"typescript",
	"tsx",
	"html",
	"astro",
})

local mason_opts = require("config.mason")
require("mason").setup(mason_opts)
vim.api.nvim_create_user_command("MasonInstallAll", function()
	if mason_opts.ensure_installed and #mason_opts.ensure_installed > 0 then
		vim.cmd("MasonInstall " .. table.concat(mason_opts.ensure_installed, " "))
	end
end, {})
vim.g.mason_binaries_list = mason_opts.ensure_installed

require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })
require("config.luasnip")

local autopairs = require("nvim-autopairs")
autopairs.setup({ fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } })
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
require("cmp").setup(require("config.cmp"))

require("nvim-tree").setup(require("config.nvimtree"))
require("telescope").setup(require("config.telescope"))
