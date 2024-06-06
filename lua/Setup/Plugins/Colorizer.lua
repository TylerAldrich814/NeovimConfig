
return {
  "NvChad/nvim-colorizer.lua", 
  
  config = function()
    require("colorizer").setup {
      filetypes = { "*" },
      user_default_options = {
        RGB      = true, 
        RRGGBB   = true,
        names    = true, 
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn   = true, 
        hsl_fn   = true,
        css      = true, 
        css_fn   = true, 
        mode     = "background", 
        tailwind = false, 
        sass = { 
          enable = true, 
          parsers = { "css" }, 
        }, 
        virtualtext = "■",
        always_update = false
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    }
  end
}
