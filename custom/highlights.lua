local M = {}

---@type Base46HLGroupsList
M.override = {
  -- Cursor
  Cursor = { bg = "white" },
  CursorLine = { bg = "black2" },
  Comment = { italic = true },
  Function = { italic = true },
  Keyword = { italic = true },
  NvDashAscii = { fg = "none", bg = "none" },
  IndentBlanklineContextStart = { bg = "none" },
  -- TreeSitter highlights
  Repeat = { fg = "pink" },
  Include = { fg = "pink" },
  ["@definition"] = { underline = false },
  ["@variable"] = { fg = "purple" },
  ["@namespace"] = { fg = "white" },
  ["@function"] = { italic = true },
  ["@keyword"] = { italic = true },
  ["@function.call"] = { fg = "pink" },
  -- NvimTree
  NvimTreeGitNew = { fg = "green" },
  NvimTreeGitDirty = { fg = "yellow" },
  NvimTreeGitDeleted = { fg = "red" },
  NvimTreeCursorLine = { bg = "one_bg3" },
}

---@type HLTable
M.add = {
  MultiCursor = { bg = "white" },
  MultiCursorMain = { bg = "white" },

  LightBulbSign = { bg = "black", fg = "yellow" },

  NvimTreeOpenedFolderName = { fg = "purple", bold = true },
  NvimTreeOpenedFile = { fg = "green", bold = true },

  -- Cmp Highlights
  CmpItemKindCodeium = { fg = "#51BDAC" },
  CmpItemKindTabNine = { fg = "#C73BE3" },

  VirtColumn = { fg = "black2" },
  FoldColumn = { bg = "black" },
  Folded = { bg = "black", fg = "white" },

  -- Tree Sitter Rainbow
  RainbowDelimiterRed = { fg = "red" },
  RainbowDelimiterYellow = { fg = "yellow" },
  RainbowDelimiterBlue = { fg = "blue" },
  RainbowDelimiterOrange = { fg = "orange" },
  RainbowDelimiterGreen = { fg = "green" },
  RainbowDelimiterViolet = { fg = "purple" },
  RainbowDelimiterCyan = { fg = "cyan" },

  DiffChange = { fg = "yellow" },
  DiffAdd = { fg = "vibrant_green" },
  DiffText = { fg = "white", bg = "red", bold = true },

  -- Search highlights
  HlSearchNear = { fg = "#2E3440", bg = "#EBCB8B" },
  HlSearchLens = { fg = "#2E3440", bg = "#88bfcf" },
  HlSearchLensNear = { fg = "#2E3440", bg = "#EBCB8B" },

  GitSignsCurrentLineBlame = {
    fg = "cyan",
  },
  --
  -- Custom highlights
  HarpoonHl = { fg = "cyan", bg = "statusline_bg" },
  BatteryHl = { fg = "nord_blue", bg = "statusline_bg" },
  SessionHl = { fg = "#e535ab", bg = "statusline_bg" },
  NotificationHl = { fg = "white", bg = "statusline_bg" },
  TermHl = { fg = "green", bg = "statusline_bg" },
  SplitHl = { fg = "white", bg = "statusline_bg" },
}

return M