
vim.g.mapleader = ' '
vim.keymap.set({'n', 'x'}, 'cp', '"+y') -- Copy to Clipboard
vim.keymap.set({'n', 'x'}, 'cv', '"+p') -- Paste from Clipboard
--vim.keymap.set({'n', 'x'}, 'x', '"_x')  -- Delete text without changing internal Registers
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>') -- Select all text in current buffer

-- Buffer Navigation
vim.keymap.set('n', '<leader>l', '<cmd>:bnext<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>:bprevious<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>:bfirst<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>:blast<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>:bd<CR>') -- Close Curent Buffer
vim.keymap.set('n', '<c-k>', '<cmd>:wincmd k<CR>')
vim.keymap.set('n', '<c-j>', '<cmd>:wincmd j<CR>')
vim.keymap.set('n', '<c-h>', '<cmd>:wincmd h<CR>')
vim.keymap.set('n', '<c-l>', '<cmd>:wincmd l<CR>')

-- WhichKey
vim.keymap.set('n', '<leader><leader>', '<cmd>:WhichKey<CR>')

-- Redo/Undo Remapping
vim.keymap.set('n', 'u', '')
vim.keymap.set('n', '<c-u>', '<cmd>:undo<CR>')
vim.keymap.set('n', '<c-r>', '<cmd>:redo<CR>')

vim.keymap.set('n', '<leader>w', '<c-w>', { remap = true })

-- Vim Diagnostics - Jump To Defintions
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		-- vim.keymap.set('n', 'gd', "<cmd>lua =vim.lsp.buf.definition<CR>", { buffer = args.buf })
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.hoverProvider then
			vim.keymap.set('n', '<leader>gd', vim.lsp.buf.hover,          { buffer = args.buf }) -- Popup with Defintions
			vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration,          { buffer = args.buf }) -- Popup with Defintions
			vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format,         { buffer = args.buf }) -- Format definition
			vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references,     { buffer = args.buf }) -- Get References
			vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = args.buf }) -- Get Implementation
			vim.keymap.set('n', '<leader>gc', vim.lsp.buf.code_action,    { buffer = args.buf }) -- Code Action
			vim.keymap.set('n', '<leader>gt', '<cmd>:ToggleDiag<CR>')
		end
	end
})

-- -- Quick Window Resizing
vim.keymap.set('n', '<leader>=', '<cmd>:vertical resize +5<CR>')
vim.keymap.set('n', '<leader>-', '<cmd>:vertical resize -5<CR>')
vim.keymap.set('n', '<leader>+', '<cmd>:horizontal resize +5<CR>')
vim.keymap.set('n', '<leader>_', '<cmd>:horizontal resize -5<CR>')


-- Fluter
vim.keymap.set('n', '<leader>fs', '<cmd>:FlutterRun<CR>')
vim.keymap.set('n', '<leader>fv', '<cmd>:FlutterVisualDebug<CR>')
vim.keymap.set('n', '<leader>fr', '<cmd>:FlutterRestart<CR>')
vim.keymap.set('n', '<leader>fq', '<cmd>:FlutterQuit<CR>')
vim.keymap.set('n', '<leader>fd', '<cmd>:FlutterDevices<CR>')
vim.keymap.set('n', '<leader>fo', '<cmd>:FlutterOutlineToggle<CR>')
vim.keymap.set('n', '<leader>fl', '<cmd>:FlutterLogClear<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- PrettyFold
vim.keymap.set('n', '<leader>FO', '<cmd>:foldopen<CR>')
vim.keymap.set('n', '<leader>FC', '@f')
