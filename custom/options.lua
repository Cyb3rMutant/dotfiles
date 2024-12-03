local opt = vim.opt
local g = vim.g
local o = vim.o

opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.list = true
opt.listchars:append "space:⋅"

-- opt.colorcolumn = "90"

opt.wrap = false
-- g.highlighturl_enabled = true -- highlight URLs by default
-- opt.splitkeep = "screen"  -- Maintain code view when splitting

-- Folding settings
-- zc fold block
-- zo unfold block
-- zM fold all blocks
-- zR unfold all blocks
-- za toggle folding
opt.foldenable = true

-- UFO
opt.foldcolumn = "1" -- show foldcolumn in nvim 0.9
opt.foldlevel = 1
opt.foldnestmax = 1
opt.foldlevelstart = 99
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- CUSTOM
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.o.signcolumn = "yes"
-- vim.o.foldcolumn = "2"
-- vim.o.signcolumn = "number"

-- Spell
-- opt.spell = true
-- opt.spelllang = { 'en_us' }

-- visual-multi
g.VM_show_warnings = 0
g.VM_default_mappings = 0
g.VM_maps = {
  ["Find Under"] = "gb",
  ["Find Subword Under"] = "gb",
}

o.statuscolumn = "%=%l%s%C"
