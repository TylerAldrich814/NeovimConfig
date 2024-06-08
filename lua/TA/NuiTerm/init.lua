--> NuiTerm/init.lua
--
local M = {}

M.config = require("TA.NuiTerm.setup").setup
M.NUITerm = require("TA.NuiTerm.Terminal.NuiTerminal").NuiTerm
M.CheckActiveTerminal = require('TA.NuiTerm.Terminal.NuiTerminal').CheckActiveTerminal
M.MoveCursorDir = require('TA.NuiTerm.Terminal.NuiTerminal').MoveCursorDir

return M
