require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})
lsp.ensure_installed({
	'rust_analyzer',
	'tsserver',
	'eslint',
  'pyright'
})


-- vim.keymap.set('n', '<leader>fw', 
-- 	function()
-- 		-- vim.cmd([[ ":update | :FlutterLogClear" ]])
-- 		vim.cmd([[:FlutterLogClear | :update ]])
-- 	end
-- );

lsp.configure('dart', {
	on_attach = function(client, bufnr)
	end
})


lsp.nvim_workspace()
lsp.setup()

require('toggle_lsp_diagnostics').init()

require('lsp-format').setup({
	dart = {
		tab_width = function()
			return vim.opt.shiftwidth:get()
		end
	}
})


