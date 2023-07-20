require('nvim-treesitter.configs').setup({
  enure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "go", "rust", "python" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
})

