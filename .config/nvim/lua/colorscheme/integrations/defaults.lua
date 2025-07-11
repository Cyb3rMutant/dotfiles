local colors = require("colorscheme.colors").base_30
local theme = require("colorscheme.colors").base_16

return {
	MatchWord = {
		bg = colors.grey,
		fg = colors.white,
	},

	Pmenu = { bg = colors.one_bg },
	PmenuSbar = { bg = colors.one_bg },
	PmenuSel = { bg = colors.pmenu_bg, fg = colors.black },
	PmenuThumb = { bg = colors.grey },

	MatchParen = { link = "MatchWord" },

	Comment = { fg = colors.grey_fg },

	CursorLineNr = { fg = colors.white },
	LineNr = { fg = colors.grey },

	-- floating windows
	FloatBorder = { fg = colors.blue },
	NormalFloat = { bg = colors.darker_black },

	NvimInternalError = { fg = colors.red },
	WinSeparator = { fg = colors.line },

	Normal = {
		fg = theme.base05,
		bg = theme.base00,
	},

	Bold = {
		bold = true,
	},

	Debug = {
		fg = theme.base08,
	},

	Directory = {
		fg = theme.base0D,
	},

	Error = {
		fg = theme.base00,
		bg = theme.base08,
	},

	ErrorMsg = {
		fg = theme.base08,
		bg = theme.base00,
	},

	Exception = {
		fg = theme.base08,
	},

	FoldColumn = {
		fg = theme.base0C,
		bg = theme.base01,
	},

	Folded = {
		fg = colors.light_grey,
		bg = colors.black2,
	},

	IncSearch = {
		fg = theme.base01,
		bg = theme.base09,
	},

	Italic = {
		italic = true,
	},

	Macro = {
		fg = theme.base08,
	},

	ModeMsg = {
		fg = theme.base0B,
	},

	MoreMsg = {
		fg = theme.base0B,
	},

	Question = {
		fg = theme.base0D,
	},

	Search = {
		fg = theme.base01,
		bg = theme.base0A,
	},

	Substitute = {
		fg = theme.base01,
		bg = theme.base0A,
		sp = "none",
	},

	SpecialKey = {
		fg = theme.base03,
	},

	TooLong = {
		fg = theme.base08,
	},

	UnderLined = {
		underline = true,
	},

	Visual = {
		bg = theme.base02,
	},

	VisualNOS = {
		fg = theme.base08,
	},

	WarningMsg = {
		fg = theme.base08,
	},

	WildMenu = {
		fg = theme.base08,
		bg = theme.base0A,
	},

	Title = {
		fg = theme.base0D,
		sp = "none",
	},

	Conceal = {
		bg = "NONE",
	},

	Cursor = {
		fg = theme.base00,
		bg = theme.base05,
	},

	NonText = {
		fg = theme.base03,
	},

	SignColumn = {
		fg = theme.base03,
		sp = "NONE",
	},

	ColorColumn = {
		bg = theme.base01,
		sp = "none",
	},

	CursorColumn = {
		bg = theme.base01,
		sp = "none",
	},

	CursorLine = {
		bg = colors.one_bg3,
	},

	QuickFixLine = {
		bg = theme.base01,
		sp = "none",
	},

	-- spell
	SpellBad = {
		undercurl = true,
		sp = theme.base08,
	},

	SpellLocal = {
		undercurl = true,
		sp = theme.base0C,
	},

	SpellCap = {
		undercurl = true,
		sp = theme.base0D,
	},

	SpellRare = {
		undercurl = true,
		sp = theme.base0E,
	},

	healthSuccess = {
		bg = colors.green,
		fg = colors.black,
	},

	-- lazy.nvim
	LazyH1 = {
		bg = colors.green,
		fg = colors.black,
	},

	LazyButton = {
		bg = colors.one_bg,
		fg = colors.light_grey,
	},

	LazyH2 = {
		fg = colors.red,
		bold = true,
		underline = true,
	},

	LazyReasonPlugin = { fg = colors.red },
	LazyValue = { fg = colors.teal },
	LazyDir = { fg = theme.base05 },
	LazyUrl = { fg = theme.base05 },
	LazyCommit = { fg = colors.green },
	LazyNoCond = { fg = colors.red },
	LazySpecial = { fg = colors.blue },
	LazyReasonFt = { fg = colors.purple },
	LazyOperator = { fg = colors.white },
	LazyReasonKeys = { fg = colors.teal },
	LazyTaskOutput = { fg = colors.white },
	LazyCommitIssue = { fg = colors.pink },
	LazyReasonEvent = { fg = colors.yellow },
	LazyReasonStart = { fg = colors.white },
	LazyReasonRuntime = { fg = colors.nord_blue },
	LazyReasonCmd = { fg = colors.sun },
	LazyReasonSource = { fg = colors.cyan },
	LazyReasonImport = { fg = colors.white },
	LazyProgressDone = { fg = colors.green },
}
