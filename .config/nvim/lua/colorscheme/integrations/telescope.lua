local colors = require("colorscheme.colors").base_30

return {
	TelescopePromptTitle = {
		fg = colors.black,
		bg = colors.red,
	},

	TelescopeSelection = { bg = colors.black2, fg = colors.white },
	TelescopeResultsDiffAdd = { fg = colors.green },
	TelescopeResultsDiffChange = { fg = colors.yellow },
	TelescopeResultsDiffDelete = { fg = colors.red },

	TelescopeBorder = { fg = colors.one_bg3 },
	TelescopePromptBorder = { fg = colors.one_bg3 },
	TelescopeResultsTitle = { fg = colors.black, bg = colors.green },
	TelescopePreviewTitle = { fg = colors.black, bg = colors.blue },
	TelescopePromptPrefix = { fg = colors.red, bg = colors.black },
	TelescopeNormal = { bg = colors.black },
	TelescopePromptNormal = { bg = colors.black },
}
