local opt = vim.opt
local o = vim.o

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorcolumn = true

opt.list = true
opt.listchars:append("space:⋅")
opt.wrap = false
opt.foldenable = true
o.statuscolumn = "%=%l%s%C"
o.colorcolumn = "88"

-- Indenting
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4

opt.ignorecase = true
opt.smartcase = true

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
