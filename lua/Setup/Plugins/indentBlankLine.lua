--> nvim/lua/Setup/Plugins/indentBlankLine.lua
--
return {
   "lukas-reineke/indent-blankline.nvim",
   main = "ibl",
   opts = {},
   config = function()
      local highlight = {
        "tblDark1",
        "tblDark2",
        "tblDark3",
        "tblMid1",
        "tblMid2",
        "tblMid3",
        "tblLight1",
        "tblLight2",
        "tblLight3",
      }
     local hooks = require("ibl.hooks")
     hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "tblDark1",  { fg = "#212529" })
        vim.api.nvim_set_hl(0, "tblDark2",  { fg = "#343a40" })
        vim.api.nvim_set_hl(0, "tblDark3",  { fg = "#495057" })
        vim.api.nvim_set_hl(0, "tblMid1",   { fg = "#6c757d" })
        vim.api.nvim_set_hl(0, "tblMid2",   { fg = "#adb5bd" })
        vim.api.nvim_set_hl(0, "tblMid3",   { fg = "#ced4da" })
        vim.api.nvim_set_hl(0, "tblLight1", { fg = "#dee2e6" })
        vim.api.nvim_set_hl(0, "tblLight2", { fg = "#e9ecef" })
        vim.api.nvim_set_hl(0, "tblLight3", { fg = "#f8f9fa" })
     end)

     require("ibl").setup({
       indent = { highlight=highlight },
     })
   end
}
