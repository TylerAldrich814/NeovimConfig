--> nvim/lua/methods/NUITerminal.lua
--
local setup = require('TA.NuiTerm.setup')
local Popup = require('nui.popup')
local DEBUG = require("TA.NuiTerm.debug").DEBUG

local TermUtil = require("TA.NuiTerm.Terminal.TerminalUtils")
local TerminalBufnr = TermUtil.TerminalBufnr
local TerminalPopup = TermUtil.TerminalPopup

local NT = {}

local current_winid = function()
  return vim.api.nvim_get_current_win()
end

function NT.NUITerm()
  if TerminalPopup and TerminalPopup.winid and vim.api.nvim_win_is_valid(TerminalPopup.winid) then
    -- Hide the popup
    DEBUG(" <-- MAIN NUI EXIT -->")
    DEBUG(" <Exit>TerminalPopup.winid = " .. TerminalPopup.winid)
    TerminalPopup:hide()
    return
  end

  local winConfig = setup.winConfig
  TerminalPopup = Popup({
    position = winConfig.position,
    size = winConfig.size,
    relative = "editor",
    border = {
      style = {
        top_left    = "╭", top    = "─",    top_right = "╮",
        left        = "│",                      right = "│",
        bottom_left = "╰", bottom = "─", bottom_right = "╯",
      },
      text = {
        top = "Terminal",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 90,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  })

  --> Mount NUI Popup Window
  TerminalPopup:mount()
  if not TerminalBufnr or not vim.api.nvim_buf_is_valid(TerminalBufnr) then
    TerminalBufnr = TermUtil.CreateTerminalBuffer(TerminalPopup.winid)
  else
    vim.api.nvim_set_current_win(TerminalPopup.winid)
    vim.api.nvim_set_current_buf(TerminalBufnr)
  end

  DEBUG(" <Creation>TerminalPopup.winid = " .. TerminalPopup.winid)
  vim.api.nvim_win_set_buf(TerminalPopup.winid, TerminalBufnr)
  vim.cmd('startinsert')

  --> Attaching <Esc> Keymapping for local terminal buffer
  vim.api.nvim_buf_set_keymap(
    TerminalBufnr,
    'n',
    '<Esc>',
    [[<cmd>lua require('TA.NuiTerm.setup').MoveCursorDir('k')<CR>]],
    {
      noremap = true,
      silent = true,
    }
  )
  vim.api.nvim_buf_set_keymap(
    TerminalBufnr,
    't',
    '<Esc>',
    [[<cmd>lua require('TA.NuiTerm.setup').MoveCursorDir('k')<CR>]],
    {
      noremap = true,
      silent = true,
    }
  )

  vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    buffer = TerminalBufnr,
    callback = function()
      if TerminalPopup and TerminalPopup.winid and vim.api.nvim_win_is_valid(TerminalPopup.winid) then
        DEBUG(" <autocmd>TerminalPopup.winid = " .. TerminalPopup.winid)
        vim.api.nvim_win_hide(TerminalPopup.winid)
        TerminalPopup:hide()
      end
    end
  })
end

function NT.CheckActiveTerminal()
  if TerminalPopup
    and TerminalPopup.winid
    and vim.api.nvim_win_is_valid(TerminalPopup.winid)
    and current_winid() == TerminalPopup.winid
  then
    NT.NUITerm()
  end
end

vim.keymap.set(
  'n',
  setup.keyMaps.term_toggle,
  function()
    NT.NUITerm()
  end,
  {
    noremap = true,
    silent  = true,
  }
)

return NT
