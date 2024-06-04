--- nvim/lua/LSP/init.lua
--  NOT INIT
    -- ○ cmp-buffer 
    -- ○ cmp-nvim-lua 
    -- ○ cmp-path 
    -- ○ lspkind-nvim 
    -- ○ LuaSnip 
    -- ○ mason-lspconfig.nvim 
    -- ○ nui.nvim 
    -- ○ nvim-autopairs 
    -- ○ nvim-cmp 
    -- ○ nvim-colorizer.lua  css 
    -- ○ undotree  UndotreeToggle  UndotreeHide  UndotreeFocus  UndotreeShow 

require("LSP.nvim_cmp")
require("LSP.treesitter")
require("LSP.symbolsOutline")
require("mason").setup()
require("mason-lspconfig").setup()

