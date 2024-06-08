--> NuiTerm/init.lua
--
local M = {}

local setup    = require("TA.NuiTerm.setup")
local term     = require("TA.NuiTerm.Terminal.NuiTerminal")
local termUtil = require("TA.NuiTerm.Terminal.TerminalUtils")

M.config              = setup.setup
M.MoveCursorDir       = setup.MoveCursorDir
M.NUITerm             = term.NuiTerm
M.CheckActiveTerminal = termUtil.CheckActiveTerminal

setup.setup({
  move_up = '<c-w><c-k>',
  move_down = '<c-w><c-j>',
  move_left = '<c-w><c-h>',
  move_right = '<c-w><c-l>',
}, {
  size = {
    width = '95%',
    height = 20,
  },
})

-- M.config = require("TA.NuiTerm.setup").setup
-- M.NUITerm = require("TA.NuiTerm.Terminal.NuiTerminal").NuiTerm
-- M.CheckActiveTerminal = require('TA.NuiTerm.Terminal.NuiTerminal').CheckActiveTerminal
-- M.MoveCursorDir = require('TA.NuiTerm.Terminal.NuiTerminal').MoveCursorDir

return M
