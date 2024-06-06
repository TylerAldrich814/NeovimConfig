--> nvim/lua/Setup/Plugins/Bufferline.lua
--
local DocGroup = {
  name = "Documentation",
  highlight = { gui = "underscore", guisp = "green" },
  icon = "",
  matcher = function(buf)
    local docExt = {"%.md", "%.txt"}
    for _, value in pairs(docExt) do
      if buf.name:match(value) then
        return true
      end
    end
    return false
  end
}

local HeaderGroup = function(bufferline)
  return {
    name = "Headers",
    highlight = {undercurl = false, sp = "green"},
    auto_close = false,
    matcher = function(buf)
      for _, value in pairs({"%.h", "%.hpp"}) do
        if buf.name:match(value) then
          return true
        end
      end
      return false
    end,
    separator = {
      style = require('bufferline.groups').separator.tab
    },
  }
end

return {
  "akinsho/bufferline.nvim",
  branch = "main",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.default,
        themable = true,
        numbers = "both",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
           icon = '▎',
           style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = "nvim_lsp",  -- Enable diagnostics
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "NvimTree",
            text_align = "center",
            separator = true,
          }
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        sort_by = function(buffer_a, buffer_b)
          return buffer_a.id > buffer_b.id
        end,
        groups = {
          options = {
            toggle_hidden_on_enter = true,
          },
          items = {
            DocGroup,
            -- HeaderGroup(bufferline),
          },
        },
      },
    })
  end
}

