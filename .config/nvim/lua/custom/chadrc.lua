---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "bearded-arc",
  transparency = false,
  nvdash = {
    load_on_startup = true,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
  telescope = { style = "bordered" },
}

M.settings = {
  cc_size = "130",
  so_size = 0,

  -- Blacklisted files where cc and so must be disabled
  blacklist = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "help",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
