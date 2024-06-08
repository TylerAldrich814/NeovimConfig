--> NuiTerm/setup.lua
--

local M = {}

local CheckActiveTerminal = require("TA.NuiTerm.Terminal.TerminalUtils").CheckActiveTerminal

--> NuiTerm Keymapping functions
function M.MoveCursorDir(dir)
  if CheckActiveTerminal() then
    require('TA.NuiTerm.Terminal.NuiTerminal').NUITerm()
  end
  vim.cmd("wincmd " .. dir)
end

M.winConfig = {
  size = {
    width = '95%',
    height = 20,
  },
  position = {
    row = "95%",
    col = "50%",
  },
}
M.keyMaps = {
  term_toggle = '<leader>tt',
  move_up     = '<c-k>',
  move_down   = '<c-j>',
  move_left   = '<c-h>',
  move_right  = '<c-l>',
}

function M.setup(user_keymaps, win_config)
  user_keymaps = user_keymaps or {}
  win_config = win_config or {}

  M.keymaps = vim.tbl_extend('force', M.keyMaps, user_keymaps)
  M.winConfig = vim.tbl_extend('force', M.winConfig, win_config)

  vim.keymap.set('n', M.keymaps.move_up,    function() M.MoveCursorDir('k') end)
  vim.keymap.set('n', M.keymaps.move_down,  function() M.MoveCursorDir('j') end)
  vim.keymap.set('n', M.keymaps.move_left,  function() M.MoveCursorDir('h') end)
  vim.keymap.set('n', M.keymaps.move_right, function() M.MoveCursorDir('l') end)
end


return M
