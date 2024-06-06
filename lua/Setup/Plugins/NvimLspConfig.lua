--> nvm/lua/Setuo/Plugins/NvimLspConfig.lua
--
return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- if you use nvim-cmp
  config = function() 
    require'lspconfig'.clangd.setup{}  
  end,
}

