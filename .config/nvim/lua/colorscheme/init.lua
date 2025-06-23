local highlights = {}

local integration_path = vim.fn.stdpath("config") .. "/lua/colorscheme/integrations"
local files = vim.fn.readdir(integration_path)

for _, file in ipairs(files) do
	local mod_name = "colorscheme.integrations." .. file:gsub("%.lua$", "")
	local m = require(mod_name)
	highlights = vim.tbl_deep_extend("force", highlights, m)
end

for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
