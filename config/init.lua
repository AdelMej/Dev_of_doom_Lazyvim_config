-- Absolute nuke for legacy SQL completion
vim.g.loaded_sql_completion = 1
vim.g.loaded_sql_ftplugin = 1
vim.g.loaded_sql_indent = 1
vim.g.loaded_sqlomni = 1

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- use tabs instead of spaces
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.env.PATH = vim.env.PATH .. ":/usr/local/bin"
