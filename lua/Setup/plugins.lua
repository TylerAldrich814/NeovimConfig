--- nvim/lua/Setup/plugins.lua
--
local CMP = {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build   = "make install_jsregexp"
  },
  "onsails/lspkind-nvim",
}

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
  "folke/which-key.nvim"
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
  CMP,
  Telescope,
  Utilites,
  UI,
  Outline,
  Themes,
}

