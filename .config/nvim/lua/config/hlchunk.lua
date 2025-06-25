local present, hlchunk = pcall(require, "hlchunk")

if not present then
	return
end

hlchunk.setup({
	indent = {
		enable = true,
		-- you can uncomment to get more indented line style
		style = {
			"#FF0000",
			"#FF7F00",
			"#FFFF00",
			"#00FF00",
			"#00FFFF",
			"#0000FF",
			"#8B00FF",
		},
	},

	line_num = {
		enable = true,
		style = "#806d9c",
	},
})
