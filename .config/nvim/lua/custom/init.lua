local opt = vim.opt
local g = vim.g
local o = vim.o

opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.list = true
opt.listchars:append "space:⋅"

opt.wrap = false
opt.foldenable = true

-- visual-multi
g.VM_show_warnings = 0
g.VM_default_mappings = 0
g.VM_maps = {
  ["Find Under"] = "gb",
  ["Find Subword Under"] = "gb",
}

o.statuscolumn = "%=%l%s%C"

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.tex" },
  group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true }),
  command = "setlocal wrap",
})
