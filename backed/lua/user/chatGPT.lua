require('chatgpt').setup({})

vim.keymap.set('n', '<leader>OI', '<cmd>:ChatGPT<CR>')
vim.keymap.set('n', '<leader>OE', '<cmd>:ChatGPTActAs<CR>')
vim.keymap.set('n', '<leader>OW', '<cmd>:ChatGPTEditWithInstructions<CR>')

-- Available Keybindings within ChatGPT Window
-- <C-Enter> to submit.
-- <C-c> to close chat window.
-- <C-u> scroll up chat window.
-- <C-d> scroll down chat window.
-- <C-y> to copy/yank last answer.
-- <C-k> to copy/yank code from last answer.
-- <C-o> Toggle settings window.
-- <C-n> Start new session.
-- <Tab> Cycle over windows.
-- <C-i> [Edit Window] use response as input.
