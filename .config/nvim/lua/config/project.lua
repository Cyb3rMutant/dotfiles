local options = {
  active = true,
  on_config_done = nil,
  manual_mode = false,
  detection_methods = { "pattern" },
  patterns = { "Cargo.toml", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "lua", ".conf" },
  show_hidden = false,
  silent_chdir = true,
  ignore_lsp = {},
  datapath = vim.fn.stdpath "data",
}

return options
