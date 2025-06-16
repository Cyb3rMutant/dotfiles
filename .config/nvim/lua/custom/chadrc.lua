---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "bearded-arc",
  nvdash = {
    load_on_startup = true,
  },

  hl_override = {
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
    NvimTreeWinSeparator = { fg = "#67bff9" },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "purple", bold = true },
    NvimTreeOpenedFile = { fg = "green", bold = true },
  },
  telescope = { style = "bordered" },
}

return M
