--- nvim/lua/Setup/Plugins/plugins.lua
--
local WhichKey       = require("Setup.Plugins.WhichKey")
local CMP            = require("Setup.Plugins.cmp")
local Telescope      = require("Setup.Plugins.Telescope")
local SymbolsOutline = require("Setup.Plugins.SymbolsOutline")
local NvimComment    = require("Setup.Plugins.NvimComment")

local LSP = {
  "L3MON4D3/LuaSnip",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
}

local UI = {
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  "akinsho/bufferline.nvim",
  "kdheepak/tabline.nvim",
  "windwp/nvim-autopairs",

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

  UI,
  Themes,

  CMP,
  Telescope,
  WhichKey,
  NvimComment,
  SymbolsOutline 
}

