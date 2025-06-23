local colors = require("colorscheme.colors").base_30

return {
	NvimTreeEmptyFolderName = { fg = colors.folder_bg },
	NvimTreeEndOfBuffer = { fg = colors.darker_black },
	NvimTreeFolderIcon = { fg = colors.folder_bg },
	NvimTreeFolderName = { fg = colors.folder_bg },
	NvimTreeFolderArrowOpen = { fg = colors.folder_bg },
	NvimTreeFolderArrowClosed = { fg = colors.grey_fg },
	NvimTreeGitDirty = { fg = colors.yellow },
	NvimTreeIndentMarker = { fg = colors.grey_fg },
	NvimTreeNormal = { bg = colors.darker_black },
	NvimTreeNormalNC = { bg = colors.darker_black },
	NvimTreeOpenedFolderName = { fg = colors.folder_bg },
	NvimTreeGitIgnored = { fg = colors.light_grey },

	NvimTreeWinSeparator = {
		fg = "#67bff9",
	},

	NvimTreeWindowPicker = {
		fg = colors.red,
		bg = colors.black2,
	},

	NvimTreeCursorLine = {
		bg = colors.one_bg3,
	},

	NvimTreeGitNew = {
		fg = colors.green,
	},

	NvimTreeGitDeleted = {
		fg = colors.red,
	},

	NvimTreeSpecialFile = {
		fg = colors.yellow,
		bold = true,
	},

	NvimTreeRootFolder = {
		fg = colors.red,
		bold = true,
	},

	NvimTreeOpenedHL = {
		fg = colors.green,
		bold = true,
	},
}
