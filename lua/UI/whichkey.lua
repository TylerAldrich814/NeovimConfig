--- nvim/lua/UI/whichkey.lua
--
-- local wk = require('which-key')
-- wk.register({
--   f = {
--     name = "Treesitter",
--     f = "-> Find File"
--   },
-- })
-- wk.window({
--   border = "shadow",
--   position = "top",
--   margin = {1, 1, 1, 1},
--   padding = {1, 2, 1, 2},
--   winblend = 30
-- })
--
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--

--# get Definition in virtical split
vim.api.nvim_set_keymap("n", "<leader>gdv", "<cmd> vsplit | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
--# get Definition in horizontal split
vim.api.nvim_set_keymap("n", "<leader>gdh", "<cmd> split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
--# Open Definition in new buffer
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>:belowright split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
-- local wk = require('which-key')

local wk = require('which-key')

local mappings = {
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<CR>", "Find File", noremap=false },
    g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
    r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    n = { "<cmd>enew<CR>", "New File" },
  },
  g = {
    name = "Definitions",
    d  = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition"},
    dv = { "<cmd> vsplit | lua vim.lsp.buf.definition()<CR>", "Go to Defintion | vsplit" },
    dh = { "<cmd> split  | lua vim.lsp.buf.definition()<CR>", "Go to Defintion | hsplit" },
    r  = { "<cmd>:belowright split | lua vim.lsp.buf.definition()<CR>", "Go to Definition | Below-Right"},
  },
  l = {
    name = "LSP",
    r = { "<cmd> lua vim.lsp.buf.references()<CR>",    "References" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
  }
}

wk.register(mappings, { prefix = "<leader>" })

return wk

