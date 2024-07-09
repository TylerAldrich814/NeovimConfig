--> nvim/lua/Setup/settings.lua
--
local opt = vim.opt
local api = vim.api
local o = vim.o

vim.opt.nu = true
vim.opt.relativenumber = false

--> Background
opt.termguicolors = true
api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })

-- enabling mousemoveevent
o.mouse = 'a'
o.clipboard = 'unnamedplus'

api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

opt.tabstop     = 2
opt.softtabstop = 2
opt.shiftwidth  = 2
opt.expandtab   = true

opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup   = false
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

-- Close File, but leave window open
vim.keymap.set('n', '<space>bw', ':bp<bar>sp<bar>bn<bar>bd<CR>', {silent=true})

-- ColorMyPencils()
