
local M = {}

M.reload_config = function()
  for name,_ in pairs(package.loaded) do
    if name:match('^Setup') or name:match('^LSP') or name:match('^UI') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.fn.stdpath('config') .. '/init.lua')
end

-->> Function called when '<leader>gt' is detected.
-->> Simply Requests for the user to input a Buffer number
M.bufferline_goto_buffer = function()
  local buffer_number = vim.fn.input("->> Jump to Buffer Number: ")
  if buffer_number == "" or buffer_number == nil then
    print("->> Jump to Buffer Cancelled")
    return
  end
  vim.cmd("BufferLineGoToBuffer " .. buffer_number)
end


isOpen = false;
-->> Toggles NvimTree -- I created this toggle in order to use 'NvimTreeFindFile'
-->> that way the cursor will automatically go to the buffer/file that's currently loaded.
M.TreeToggle = function()
  if isOpen  then
    vim.cmd("NvimTreeClose")
    isOpen = false
  else 
    vim.cmd("NvimTreeFindFile")
    isOpen = true
  end
end

M.ToggleSplit = function()
  -->> wincmd H 
  -->> wincmd J 
  -->> wincmd K 
  -->> wincmd L 
  local current_win = vim.api.nvim_get_current_win()
  vim.cmd('wincmd J')
  if vim.api.nvim_get_current_win() == current_win then
    vim.cmd('wincmd L')
  end
end


return M
