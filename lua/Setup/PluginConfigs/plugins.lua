-- require("Setup.PluginConfigs.WhichKey")
-- local WhichKey = require("Setup.PluginConfigs.WhichKey")

-- # stacktrace:                                                                                                                                                                                                                                                                                    
--   - lazy.lua:16                                                                                                                                                                                                                                                                                  
--   - init.lua:6                                                                                                                                                                                                                                                                                   
--   - ~/.config/nvim/init.lua:1                                                                                                                                                                                                                                                                    
-- Press ENTER or type command to continue
--
local WhichKey = require("Setup.PluginConfigs.WhichKey")
local Telescope = require("Setup.PluginConfigs.Telescope")
local CMP = require("Setup.PluginConfigs.cmp")
local SymbolsOutline = require("Setup.PluginConfigs.SymbolsOutline")

local LSP = {
  "L3MON4D3/LuaSnip",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
}

local Telescope = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-z.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}

local Utilites = {
  "petertriho/cmp-git",
}

local UI = {
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  "akinsho/bufferline.nvim",
  "kdheepak/tabline.nvim",
	"terrortylor/nvim-comment",
  "windwp/nvim-autopairs",

}

local Outline = {
  "simrat39/symbols-outline.nvim",
  cmd = "SymbolsOutline",
  keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  config = true,
}

local Themes = {
  {
    "rebelot/kanagawa.nvim", event = "VeryLazy"
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
  },
  { "NvChad/nvim-colorizer.lua", ft = { "css" } },
}

return {
  "MunifTanjim/nui.nvim",
  {
    "mbbill/undotree",
    cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
  },
  LSP,

  Utilites,
  UI,
  Themes,

  CMP,
  Telescope,
  Outline,
  WhichKey,
  -- SymbolsOutline,
  Outline
}

