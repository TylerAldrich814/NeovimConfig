--> nvim/init.lua
--
require("Setup.init")
require("Setup.lazy")
require("LSP.init")
require("DAP.init")
require("UI.init")

-- require("Methods.terminal")
require("Methods.NuiTerminal")

vim.keymap.set(
  'n', 
  '<leader>tj', 
  function() require('Methods.NuiTerminal').toggle_terminal_popup() end, 
  { noremap = true, silent = true }
)

