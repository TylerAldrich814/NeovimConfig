--> NuiTerm/Terminal/TerminalUtils.lua
--
local M = {}

M.TerminalPopup = nil
M.TerminalBufnr = nil

function M.CreateTerminalBuffer(winid)
  local term_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_win(winid)
  vim.api.nvim_set_current_buf(term_buf)
  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.api.nvim_buf_delete(term_buf, { force = true })
    end
  })
  return term_buf
end

-- @returns True if M.TerminalPopup is Active
function M.CheckActiveTerminal()
  return M.TerminalPopup
     and M.TerminalPopup.winid
     and vim.api.nvim_win_is_valid(M.TerminalPopup.winid)
end

return M
