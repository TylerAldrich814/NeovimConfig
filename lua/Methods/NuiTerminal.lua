--> nvim/lua/methods/NUITerminal.lua
--
local Popup = require('nui.popup')
local event = require('nui.utils.autocmd').event
local autocmd = require('nui.utils.autocmd')

MSG_ID = 0
local debug_active = false
local function DEBUG(msg)
  if debug_active then
    print(" - [" .. MSG_ID .. "] :: " .. msg)
    MSG_ID = MSG_ID + 1
  end
end

--> Forwards declarations
local CheckActiveTerminal
local MoveCursorDir
local NUITerm

local terminal_popup = nil
local terminal_bufnr = nil

local current_winid = function()
  return vim.api.nvim_get_current_win()
end

local function _create_terminal_buffer(winid)
  local term_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_win(winid)
  vim.api.nvim_set_current_buf(term_buf)
  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.api.nvim_buf_delete(terminal_bufnr, { force = true })
    end
  })
  return term_buf
end

function NUITerm()
  if terminal_popup and terminal_popup.winid and vim.api.nvim_win_is_valid(terminal_popup.winid) then
    -- Hide the popup
    DEBUG(" <-- MAIN NUI EXIT -->")
    DEBUG(" <Exit>TerminalPopup.winid = " .. terminal_popup.winid)
    -- vim.api.nvim_win_hide(terminal_popup.winid)
    terminal_popup:hide()
    return
  end
  terminal_popup = Popup({
    position = {
      row = "95%",
      col = "50%",
    },
    size = {
      width = "95%",
      height = 20,
    },
    relative = "editor",
    border = {
      style = {
        top_left    = "╭", top    = "─",    top_right = "╮",
        left        = "│",                      right = "│",
        bottom_left = "╰", bottom = "─", bottom_right = "╯",
      },
      text = {
        top = "Terminal",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  })

  --> Mount NUI Popup Window
  terminal_popup:mount()
  if not terminal_bufnr or not vim.api.nvim_buf_is_valid(terminal_bufnr) then
    terminal_bufnr = _create_terminal_buffer(terminal_popup.winid)
  else
    vim.api.nvim_set_current_win(terminal_popup.winid)
    vim.api.nvim_set_current_buf(terminal_bufnr)
  end

  DEBUG(" <Creation>TerminalPopup.winid = " .. terminal_popup.winid)
  vim.api.nvim_win_set_buf(terminal_popup.winid, terminal_bufnr)

  --> Attaching <Esc> Keymapping for local terminal buffer
  vim.api.nvim_buf_set_keymap(
    terminal_bufnr,
    'n',
    '<Esc>',
    [[<cmd>lua require('Methods.NuiTerminal').MoveCursorDir('k')<CR>]],
    {
      noremap = true,
      silent = true,
    }
  )
  vim.api.nvim_buf_set_keymap(
    terminal_bufnr,
    't',
    '<Esc>',
    [[<cmd>lua require('Methods.NuiTerminal').MoveCursorDir('k')<CR>]],
    {
      noremap = true,
      silent = true,
    }
  )

  vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    buffer = terminal_bufnr,
    callback = function()
      if terminal_popup and terminal_popup.winid and vim.api.nvim_win_is_valid(terminal_popup.winid) then
        DEBUG(" <autocmd>TerminalPopup.winid = " .. terminal_popup.winid)
        vim.api.nvim_win_hide(terminal_popup.winid)
        terminal_popup:hide()
      end
    end
  })
end

vim.keymap.set(
  'n',
  '<leader>tt',
  function()
    NUITerm()
  end,
  {
    noremap = true,
    silent  = true,
  }
)

function CheckActiveTerminal()
  if terminal_popup
    and terminal_popup.winid
    and vim.api.nvim_win_is_valid(terminal_popup.winid)
    and current_winid() == terminal_popup.winid
  then
    NUITerm()
  end
end

--> NuiTerm Keymapping functions
function MoveCursorDir(dir)
  CheckActiveTerminal()
  vim.cmd("wincmd " .. dir)
end

vim.keymap.set('n', '<c-k>', function() MoveCursorDir('k') end)
vim.keymap.set('n', '<c-j>', function() MoveCursorDir('j') end)
vim.keymap.set('n', '<c-h>', function() MoveCursorDir('h') end)
vim.keymap.set('n', '<c-l>', function() MoveCursorDir('l') end)

return {
  NUITerm = NUITerm,
  MoveCursorDir = MoveCursorDir,
  terminal_popup = terminal_popup,
}


-- Additional mappings for convenience
-- vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })  -- Move to left window
-- vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })  -- Move to bottom window
-- vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })  -- Move to top window
-- vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })  -- Move to right window

