require('nord').set({
  disable_background_color = true
})

-- require('nord.nvim').setup({
--   disable_background_color = true
-- })
--
function ColorMyPencils( color )
  color = color or "nord"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
