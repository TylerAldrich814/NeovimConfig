--- nvim/lua/LSP/init.lua
--

--# get Definition in virtical split
vim.api.nvim_set_keymap("n", "<leader>gdv", "<cmd> vsplit | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
--# get Definition in horizontal split
vim.api.nvim_set_keymap("n", "<leader>gdh", "<cmd> split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
--# Open Definition in new buffer
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>:belowright split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
