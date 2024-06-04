--- nvim/lua/setup/init.lua
--
require("Setup.settings")
require("Setup.remap")
require("Setup.lazy")
require("Setup.nvim_comment")
require("Setup.undo_tree")
require("bufferline").setup()