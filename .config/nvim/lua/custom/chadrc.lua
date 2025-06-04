---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "bearded-arc",
  nvdash = {
    load_on_startup = true,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
  telescope = { style = "bordered" },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
