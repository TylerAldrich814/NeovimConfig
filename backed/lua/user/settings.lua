-- Disable Netrw at the very start of our init.lua file - For 
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwplugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.number      = true
vim.opt.ignorecase  = true
vim.opt.smartcase   = true
vim.opt.hlsearch    = true
vim.opt.breakindent = true
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.softtabstop = 2
vim.opt.expandtab   = false
vim.opt.signcolumn  = 'yes'
vim.opt.encoding    = 'UTf-8'

vim.cmd[[
	set autoindent expandtab tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
]]
