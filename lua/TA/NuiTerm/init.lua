--> NuiTerm/init.lua
--
local setup = require("TA.NuiTerm.setup")
local term = require("TA.NuiTerm.Terminal.NuiTerminal")

local M = {}

M.config = setup.setup
M.MoveCursorDir = setup.MoveCursorDir
M.NUITerm = term.NUITerm
M.CheckActiveTerminal = term.CheckActiveTerminal

return M

