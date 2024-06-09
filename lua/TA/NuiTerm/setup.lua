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
