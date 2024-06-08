--> NuiTerm/init.lua
--
local setup    = require("TA.NuiTerm.setup")
local term     = require("TA.NuiTerm.Terminal.NuiTerminal")
local termUtil = require("TA.NuiTerm.Terminal.TerminalUtils")

local M = {}

M.config              = setup.setup
M.MoveCursorDir       = setup.MoveCursorDir
M.NUITerm             = term.NuiTerm
M.CheckActiveTerminal = termUtil.CheckActiveTerminal

setup.setup({
  move_up    = '<c-k>',
  move_down  = '<c-j>',
  move_left  = '<c-h>',
  move_right = '<c-l>',
}, {
  size = {
    width = '95%',
    height = 20,
  },
})

return M

