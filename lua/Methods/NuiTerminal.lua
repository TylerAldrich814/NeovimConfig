local Popup = require('nui.popup')
local event = require('nui.utils.autocmd').event
local autocmd = require('nui.utils.autocmd')

local terminal_popup = nil
local terminal_bufnr = nil

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

local function toggle_terminal_popup()
  if terminal_popup and terminal_popup.winid and vim.api.nvim_win_is_valid(terminal_popup.winid) then
    -- Hide the popup
    vim.api.nvim_win_hide(terminal_popup.winid)
  else
    -- Create a new popup window for the terminal
    -- (upvalue) Popup: NuiPopup|fun(options: nui_popup_options):NuiPopup {
  --     border: NuiPopupBorder,
  --     bufnr: integer,
  --     hide: function,
  --     init: function,
  --     map: function,
  --     mount: function,
  --     ns_id: integer,
  --     off: function <-- ,
  --     on: function,
  --     set_layout: function,
  --     set_position: function,
  --     set_size: function,
  --     show: function,
  --     unmap: function,
  --     unmount: function,
  --     update_layout: function,
  --     win_config: { focusable: boolean, style: 'minimal', zindex: number, relative: 'cursor'|'editor'|'win', win: number, bufpos: number[], row: number, col: number, width: number, height: number, b...(too long)...SE"|"SW" },
  --     winid: number,
  --     _buf_create: function,
  --     _buf_destroy: function,
  --     _close_window: function,
  --     _open_window: function,
  -- }
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
      buf_options = {
        modifiable = true,
        readonly   = false,
      },
      win_options = {
        winblend = 10,
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    })

    --> Mount Nui Popup Window
    terminal_popup:mount()
    if not terminal_bufnr or not vim.api.nvim_buf_is_valid(terminal_bufnr) then
      terminal_bufnr = _create_terminal_buffer(terminal_popup.winid)
    end

    --> Close the popup when leaving the window
    vim.api.nvim_win_set_buf(terminal_popup.winid, terminal_bufnr)

    autocmd.create(event.BufLeave, {
      buffer = terminal_bufnr,
      callback = function()
        if terminal_popup.winid and vim.api.nvim_win_is_valid(terminal_popup.winid) then
          vim.api.nvim_win_hide(terminal_popup.winid)
        end
      end
    })
    autocmd.create(event.WinLeave, {
      buffer = terminal_bufnr,
      callback = function()
        print("WIN LEAVE")
        if terminal_popup.winid and vim.api.nvim_win_is_valid(terminal_popup.winid) then
          vim.api.nvim_win_hide(terminal_popup.winid)
        end
      end
    })
  end
end

vim.keymap.set('n', '<leader>th', function() toggle_terminal_pane('LEFT')   end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tk', function() toggle_terminal_pane('TOP')    end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tj', function() toggle_terminal_pane('BOTTOM') end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tl', function() toggle_terminal_pane('RIGHT')  end, { noremap = true, silent = true })

--> Terminal Convient keymappings
---- Map <Esc> to exit terminal mode and switch to normal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Additional mappings for convenience
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })  -- Move to left window
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })  -- Move to bottom window
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })  -- Move to top window
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })  -- Move to right window

return {
  toggle_terminal_popup = toggle_terminal_popup
}

