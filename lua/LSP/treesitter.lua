--- nvim/lua/LSP/treesitter.lua
--
require("LSP.treesitter")
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "c", "cpp", "lua", "python", "vim", "vimdoc", "html", "css", "javascript", "typescript", "query"
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

