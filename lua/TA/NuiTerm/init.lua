--> NuiTerm/init.lua
--
local setup    = require("TA.NuiTerm.setup")
local termUtil = require("TA.NuiTerm.Terminal.TerminalUtils")
local window   = require("TA.NuiTerm.Terminal.window")

local M = {}

M.config              = setup.setup
M.CheckActiveTerminal = termUtil.CheckActiveTerminal

M.window = window.MainWindow:new()

function M.MoveCursorDir(dir)
  vim.cmd('wincmd ' .. dir)
end


vim.keymap.set('n', setup.keyMaps.move_up,    function() M.MoveCursorDir('k') end)
vim.keymap.set('n', setup.keyMaps.move_down,  function() M.MoveCursorDir('j') end)
vim.keymap.set('n', setup.keyMaps.move_left,  function() M.MoveCursorDir('h') end)
vim.keymap.set('n', setup.keyMaps.move_right, function() M.MoveCursorDir('l') end)

vim.keymap.set(
  'n',
  setup.keyMaps.term_toggle,
  function()
    M.window:Toggle()
  end,
  {
    noremap = true,
    silent  = true,
  }
)

return M

