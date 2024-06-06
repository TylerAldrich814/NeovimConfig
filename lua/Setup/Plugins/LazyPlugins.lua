--- nvim/lua/Setup/Plugins/plugins.lua
--
local Colorizer      = require("Setup.Plugins.Colorizer")
local AutoPairs      = require("Setup.Plugins.AutoPairs")
local WhichKey       = require("Setup.Plugins.WhichKey")
local CMP            = require("Setup.Plugins.CMP")
local NvimLspConfig  = require("Setup.Plugins.NvimLspConfig")
local Mason          = require("Setup.Plugins.Mason")
local NvimDAP        = require("Setup.Plugins.NvimDAP")
local Lazydev        = require("Setup.Plugins.Lazydev")
local Telescope      = require("Setup.Plugins.Telescope")
local SymbolsOutline = require("Setup.Plugins.SymbolsOutline")
local NvimComment    = require("Setup.Plugins.NvimComment")
local Nvimtree       = require("Setup.Plugins.Nvimtree")
local Bufferline     = require("Setup.Plugins.Bufferline");
local Lualine        = require("Setup.Plugins.Lualine")
local Undotree       = require("Setup.Plugins.Undotree")

local Themes = {
  {
    "rebelot/kanagawa.nvim", event = "VeryLazy"
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
  },
}

return {
  "MunifTanjim/nui.nvim", -- UI Library for making popup windows
  Undotree,
  Mason,
  NvimDAP,
  Lazydev,
  Themes,
  Colorizer,
  NvimLspConfig,
  CMP,
  AutoPairs,
  Bufferline,
  Telescope,
  NvimComment,
  Nvimtree,
  Lualine,
  SymbolsOutline,
  WhichKey,
}

