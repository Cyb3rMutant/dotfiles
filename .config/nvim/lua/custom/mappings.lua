---@type MappingsTable
local M = {}

-- <C> -> Ctrl
-- <leader> -> Space
-- <A> -> alt
-- <S> -> shift
-- <M> -> meta (cmd key on mac)
-- <D> -> super (windows key on windows)
-- <kPoint> -> Keypad Point (.)
-- <kEqual> -> Keypad Equal (=)
-- <kPlus> -> Keypad Plus (+)
-- <kMinus> -> Keypad Minus (-)

M.disabled = {
  n = {
    ["<leader>b"] = "",
    ["<C-n>"] = "",
    ["<leader>e"] = "",
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<C-Up>"] = { ":resize -2<CR>", "Resize Up" },
    ["<C-Down>"] = { ":resize +2<CR>", "Resize Down" },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Resize Left" },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "Resize Right" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["kj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

M.text = {
  v = {
    ["<C-Up>"] = { ":m'<-2<CR>gv=gv", "Move selection up", opts = { silent = true } },
    ["<C-Down>"] = { ":m'>+1<CR>gv=gv", "Move selection down", opts = { silent = true } },
    -- Indent backward/forward:
    ["<"] = { "<gv", "Ident backward", opts = { silent = false } },
    [">"] = { ">gv", "Ident forward", opts = { silent = false } },
  },
}

return M
