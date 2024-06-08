--> NuiTerm/setup.lua
--
local M = {}

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
  move_up = '<c-k>',
  move_down = '<c-j>',
  move_left = '<c-h>',
  move_right = '<c-l>',
}

function M.setup(user_keymaps, win_config)
  user_keymaps = user_keymaps or {}
  win_config = win_config or {}

  M.keyMaps = vim.tbl_extend('force', M.keyMaps, user_keymaps)
  M.winConfig = vim.tbl_extend('force', M.winConfig, win_config)
end

return M

-- M.MainWindow = require('TA.NuiTerm.Terminal.window').MainWindow

-- function CheckActiveTerminal()
--   if TerminalPopup
--     and TerminalPopup.winid
--     and vim.api.nvim_win_is_valid(TerminalPopup.winid)
--     and current_winid() == TerminalPopup.winid
--   then
--     NT.NUITerm()
--   end
-- end

-- local function CheckActiveTerminal()
--   return require("TA.NuiTerm.Terminal.NuiTerminal").CheckActiveTerminal()
--   -- return require("TA.NuiTerm.Terminal.window").
--   -- M.MainWindow:Toggle()
-- end

-- function M.MoveCursorDir(dir)
--   CheckActiveTerminal()
--   vim.cmd("wincmd " .. dir)
-- end

-- vim.keymap.set('n', M.keyMaps.move_up,    function() M.MoveCursorDir('k') end)
-- vim.keymap.set('n', M.keyMaps.move_down,  function() M.MoveCursorDir('j') end)
-- vim.keymap.set('n', M.keyMaps.move_left,  function() M.MoveCursorDir('h') end)
-- vim.keymap.set('n', M.keyMaps.move_right, function() M.MoveCursorDir('l') end)

