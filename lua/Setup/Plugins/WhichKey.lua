--> nvim/lua/Setup/Plugins/WhichKey.lua
--
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout    = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({
      window = {
        border = "shadow",
        position = "top",
        margin = { 1, 1, 1, 1 },
        padding = { 1, 2, 1, 2 },
        winblend = 30,
      },
    })
  end,
}
