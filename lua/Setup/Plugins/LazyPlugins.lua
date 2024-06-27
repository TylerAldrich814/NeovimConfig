--> nvim/lua/Setup/Plugins/plugins.lua
--
local IndentBlankLine = require("Setup.Plugins.indentBlankLine")
local Colorizer       = require("Setup.Plugins.Colorizer")
local AutoPairs       = require("Setup.Plugins.AutoPairs")
local WhichKey        = require("Setup.Plugins.WhichKey")
local CMPandLSP       = require("Setup.Plugins.CompletionAndLSP")
local Mason           = require("Setup.Plugins.Mason")
local NvimDAP         = require("Setup.Plugins.NvimDAP")
local Lazydev         = require("Setup.Plugins.Lazydev")
local Telescope       = require("Setup.Plugins.Telescope")
local SymbolsOutline  = require("Setup.Plugins.SymbolsOutline")
local NvimComment     = require("Setup.Plugins.NvimComment")
local Nvimtree        = require("Setup.Plugins.Nvimtree")
local Bufferline      = require("Setup.Plugins.Bufferline");
local Lualine         = require("Setup.Plugins.Lualine")
local Undotree        = require("Setup.Plugins.Undotree")
local Oil             = require("Setup.Plugins.Oil")

local DAPPython = {
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup("python")
  end
};

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

  {
    -- dir = "~/.config/nvim/dev/NUITerm.nvim",

    "NUITerm.nvim",
    dev = true,
    dependencies = {
      "kkharji/sqlite.lua"
    },
    config = function()
      require('NuiTerm').setup({
        nuiterm_db = {
          storage_location = nil,
          auto_save = false,
        },
        win_config = {
          width = "5/6",
          height = 30,
          position = "bottom",
        },
        user_keymaps = {
          change_mode    = "<Esc>",
          nuiterm_toggle = "<leader>tt",
          new_term       = "<leader>tn",
          next_term      = "<leader>tk",
          prev_term      = "<leader>tj",
          close_term     = "<leader>tq",
          term_resize    = {
            expand = { cmd = "<C-p>", amt =  1 },
            shrink = { cmd = "<C-o>", amt = -1 }
          },
        }
      })
    end
  },

  IndentBlankLine,
  Undotree,
  Mason,
  NvimDAP,
  DAPPython,
  Lazydev,
  Themes,
  Colorizer,
  CMPandLSP,
  AutoPairs,
  Bufferline,
  Telescope,
  NvimComment,
  Nvimtree,
  Lualine,
  SymbolsOutline,
  Oil,
  WhichKey,
}

