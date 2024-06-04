--- nvim/lua/UI/nvim_tree.lua
--
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
