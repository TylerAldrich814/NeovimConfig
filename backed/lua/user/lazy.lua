-- Lazy install for Lazy.nvim Plugin Manager
local lazy = {}
function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git', '--branch=stable',
			path,
		})
	end
end

function lazy.setup(plugins)
	-- After lazy is installed. This next line can me removed/commented out
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

-- Plugins
lazy.setup({
  -- ChatGPT
  {'jackMort/ChatGPT.nvim'},
  {'MunifTanjim/nui.nvim'},

	{'nvim-lualine/lualine.nvim'},
	{'nvim-tree/nvim-web-devicons'},
	{'nvim-tree/nvim-tree.lua'},
	{'akinsho/bufferline.nvim'},
	{'nvim-treesitter/nvim-treesitter'},

	-- LSP Support
	{'VonHeikemen/lsp-zero.nvim'},
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'},
	{'onsails/lspkind.nvim'},

	{'lukas-reineke/lsp-format.nvim'},

	-- Autocompletion
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'saadparwaiz1/cmp_luasnip'},
	{'hrsh7th/cmp-nvim-lsp'},
	-- DAP
	{"mfussenegger/nvim-dap"},

	-- Snippets
	{'L3MON4D3/LuaSnip'},
	{'rafamadriz/friendly-snippets'},

	{'akinsho/flutter-tools.nvim'},
	{'nvim-lua/plenary.nvim'},
	{'nvim-telescope/telescope.nvim', tag = '0.1.1',},

	{'rmagatti/goto-preview'},

	-- Startup Nvim
	{'startup-nvim/startup.nvim'},
	{'terrortylor/nvim-comment'},

	-- UndoTree
	{'mbbill/undotree'},
	-- Keep Cursor Centered
  -- ps
	{'arnamak/stay-centered.nvim'},

	-- Styling
	{'folke/which-key.nvim'},
	{'gelguy/wilder.nvim'},
	{'lukas-reineke/indent-blankline.nvim'},
	{'ryanoasis/vim-devicons'},
  {'anuvyklack/pretty-fold.nvim'},
	{
		'andymass/vim-matchup',
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

  -- Github Copilot
  {'github/copilot.vim'},

	{'jiangmiao/auto-pairs'},
	-- Themes
	{'folke/tokyonight.nvim'},
	{'sainnhe/everforest'},
	{'edeneast/nightfox.nvim'},
})
