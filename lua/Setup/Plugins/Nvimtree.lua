--- nvim/lua/Setup/Plugins/Nvimtree.lua

return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('nvim-tree').setup({
        -- mappings = {
        --   list = {
        --     { key = "<C-b>v", action = "vsplit" },
        --   },
        -- },
      -- on_attach = on_attach,
      view = {
        width = 30,
      },
      disable_netrw = false,
      hijack_netrw  = true,
    })
  end,
  lazy = false,
}

-- /Users/tyleraldrich/.local/share/nvim

