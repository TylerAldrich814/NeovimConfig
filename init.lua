--> nvim/init.lua
--
require("Setup.init")
require("Setup.lazy")
require("LSP.init")
require("DAP.init")
require("UI.init")

-- require("TA.NuiTerm").config({
-- })
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.cmd("wincmd k")<cr>')
vim.keymap.set('n', '<C-j>', '<cmd>lua vim.cmd("wincmd j")<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>lua vim.cmd("wincmd h")<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>lua vim.cmd("wincmd l")<cr>')

-- vim.keymap.set('n', setup.keyMaps.move_up,    function() M.MoveCursorDir('k') end)
-- vim.keymap.set('n', setup.keyMaps.move_down,  function() M.MoveCursorDir('j') end)
-- vim.keymap.set('n', setup.keyMaps.move_left,  function() M.MoveCursorDir('h') end)
-- vim.keymap.set('n', setup.keyMaps.move_right, function() M.MoveCursorDir('l') end)


--> Reload NuiTerm via <leader>tr
vim.keymap.set('n', '<leader>tr', function()
  local plugin_path = vim.fn.stdpath('config') .. '/dev/NuiTerm.nvim/'

  for name, _ in pairs(package.loaded) do
    if name:match('^NuiTerm.nvim') then
      package.loaded[name] = nil
    end
  end

  vim.cmd('source', plugin_path .. "lua/NuiTerm/init.lua")
  print("NuiTerm Reloaded!")
end, {noremap=true, silent=true})
