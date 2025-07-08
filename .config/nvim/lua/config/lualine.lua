local function wide_enough()
	return vim.fn.winwidth(0) > 80
end
local opts = {
	options = {
		globalstatus = vim.o.laststatus == 3,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},

	sections = {
		lualine_a = {
			{
				"mode",
				separator = { left = "", right = "" },
				padding = { left = 1, right = 0 },
			},
		},
		lualine_b = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = true, -- Display new file status (new file means no write after created)
				path = 1, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory
				-- 4: Filename and parent dir, with tilde as the home directory
				--

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[unnamed]", -- Text to show for unnamed buffers.
					newfile = "[New]", -- Text to show for newly created file before first write
				},
			},
			{
				"diagnostics",
			},
		},
		lualine_c = {
			{ "%=", padding = 0 },
			{
				"datetime",
				style = "%H:%M",
				separator = { left = "", right = "" },
				padding = 1,
				color = { fg = "black", bg = "white", gui = "bold" },
				cond = wide_enough,
			},
		},
		lualine_x = {},
		lualine_y = {
			{
				"diff",
				symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff
				cond = wide_enough,
			},
			{
				function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
			},
		},
		lualine_z = {
			{
				"progress",
				separator = { left = "", right = "" },
				padding = { left = 0, right = 1 },
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			{
				"filename",
				file_status = false,
				path = 1,
				color = { fg = "white" },
			},
		},
		lualine_c = {
			{ "%=", padding = 0 },
			{
				"datetime",
				style = "%H:%M",
				separator = { left = "", right = "" },
				padding = 1,
				color = { fg = "black", bg = "white", gui = "bold" },
			},
		},
		lualine_x = {},
		lualine_y = {
			{
				function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				color = { fg = "white" },
			},
		},
		lualine_z = {},
	},
}

return opts
