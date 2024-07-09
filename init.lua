--> nvim/init.lua
--
require("Setup.init")
require("Setup.lazy")
require("LSP.init")
require("DAP.init")
require("UI.init")

vim.keymap.set('n', '<C-k>', '<cmd>lua vim.cmd("wincmd k")<cr>')
vim.keymap.set('n', '<C-j>', '<cmd>lua vim.cmd("wincmd j")<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>lua vim.cmd("wincmd h")<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>lua vim.cmd("wincmd l")<cr>')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })

vim.cmd[[colorscheme kanagawa-wave]]
