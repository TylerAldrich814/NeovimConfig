--- nvim/lua/Setup/Plugins/NvimComment.lua
--
return {
	"terrortylor/nvim-comment",
  config = function()
    require('nvim_comment').setup({
      marker_padding   = true,
      comment_empty    = true,
      comment_empty_trim_whitespace = true,
      create_mappings  = true,
      line_mapping     = '<leader>cc',
      operator_mapping = '<leader>co',
      comment_chunk_text_object = '<leader>.',
      hook = nil
    })
  end
}
