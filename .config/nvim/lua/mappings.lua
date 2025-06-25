local map = vim.keymap.set

map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("i", "jk", "<ESC>", { desc = "escape insert mode" })
map("i", "kj", "<ESC>", { desc = "escape insert mode" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "resize left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "resize right" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "resize down" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "resize up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- move around wrapped lines
map({ "n", "x", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map({ "n", "x", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })

map("v", "<", "<gv", { desc = "indent line" })
map("v", ">", ">gv", { desc = "indent line" })

map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "dont copy replaced text" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>w", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map(
	"n",
	"<leader>j",
	"<cmd>Telescope buffers sort_mru=true initial_mode=normal<CR>",
	{ desc = "telescope find buffers" }
)
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>a",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- new terminals
map({ "n", "t" }, "<A-v>", function()
	require("nvterm.terminal").toggle("vertical")
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
	require("nvterm.terminal").toggle("horizontal")
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
	require("nvterm.terminal").toggle("float")
end, { desc = "terminal toggle floating term" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- lsp
map("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definition" })

map("n", "gD", function()
	vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })

map("n", "K", function()
	vim.lsp.buf.hover({
		border = "rounded",
	})
end, { desc = "LSP hover" })

map("n", "gr", function()
	vim.lsp.buf.references()
end, { desc = "references" })

map("n", "<leader>lf", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "diagnostics window" })
