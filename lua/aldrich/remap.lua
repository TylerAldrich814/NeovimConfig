vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste Buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "<leaader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- Open up Neovim Packer Configuration File
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/.config/nvim/lua/aldrich/packer.lua<CR>")

vim.keymap.set('n', '<leader><leader>', '<cmd>:WhichKey<CR>')

vim.keymap.set('n', 'u', '')
vim.keymap.set('n', '<C-u>', '<cmd>:undo<CR>')
vim.keymap.set('n', '<C-r>', '<cmd>:redo<CR>')

-- Buffer Navigation
vim.keymap.set('n', '<leader>k', '<cmd>:TablineBufferNext<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>:TablineBufferPrev<CR>')
vim.keymap.set('n', '<c-k>', '<cmd>:wincmd k<CR>')
vim.keymap.set('n', '<c-j>', '<cmd>:wincmd j<CR>')
vim.keymap.set('n', '<c-h>', '<cmd>:wincmd h<CR>')
vim.keymap.set('n', '<c-l>', '<cmd>:wincmd l<CR>')

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

--vim.keymap.set("n", "<leader><leader>", function()
  --vim.cmd("so")
--end)
