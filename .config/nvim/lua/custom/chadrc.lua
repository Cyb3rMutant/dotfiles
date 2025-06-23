---@type ChadrcConfig
local M = {}

M.ui = {
  hl_override = {
    -- Cursor
    CursorLine = { bg = "one_bg3" },
    -- TreeSitter highlights
    Include = { fg = "pink" },
    ["@variable"] = { fg = "purple" },
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
    NvimTreeOpenedFile = { fg = "green", bold = true },
  },
}

return M
