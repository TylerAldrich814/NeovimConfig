--> nvim/lua/Methods/terminal.lua
--

local DEFAULT_WIDTH = 40
local DEFAULT_HEIGHT = 20

-- _current_term_pos = ""
local terminal_bufnr = nil
local terminal_winid = nil

local function toggle_terminal_pane(pos)
  local function __move_horizontal__(callback, loc)
    vim.cmd('vsplit')
    vim.cmd('wincmd ' .. loc)
    vim.cmd('vertical resize ' .. DEFAULT_WIDTH )
    callback()
  end
  local function __move_veritcal__(callback, loc)
    vim.cmd('split')
    vim.cmd('wincmd ' .. loc)
    vim.cmd('resize ' .. DEFAULT_HEIGHT) 
    callback()
  end

-- Check if the terminal buffer exists and is hidden
  if terminal_bufnr and vim.api.nvim_buf_is_loaded(terminal_bufnr) then
    if terminal_winid and vim.api.nvim_win_is_valid(terminal_winid) then
      -- Close the terminal window
      vim.api.nvim_win_hide(terminal_winid)
      terminal_winid = nil
    else
      if pos == 'LEFT' then
        __move_horizontal__(function()
          vim.api.nvim_set_current_buf(terminal_bufnr)
          terminal_winid = vim.api.nvim_get_current_win()
        end, 'h')
      elseif pos == 'RIGHT' then
        __move_horizontal__(function()
          vim.api.nvim_set_current_buf(terminal_bufnr)
          terminal_winid = vim.api.nvim_get_current_win()
        end, 'l')
      elseif pos == 'TOP' then
        __move_veritcal__(function()
          vim.api.nvim_set_current_buf(terminal_bufnr)
          terminal_winid = vim.api.nvim_get_current_win()
        end, 'k')
      elseif pos == 'BOTTOM' then
        __move_veritcal__(function()
          vim.api.nvim_set_current_buf(terminal_bufnr)
          terminal_winid = vim.api.nvim_get_current_win()
        end, 'j')
      end
    end
  else
    if pos == 'LEFT' then
      __move_horizontal__(function()
        vim.cmd('terminal')
        terminal_bufnr = vim.api.nvim_get_current_buf()
        terminal_winid = vim.api.nvim_get_current_win()
      end, 'h')

    elseif pos == 'RIGHT' then
      __move_horizontal__(function()
        vim.cmd('terminal')
        terminal_bufnr = vim.api.nvim_get_current_buf()
        terminal_winid = vim.api.nvim_get_current_win()
      end, 'l')
    elseif pos == 'TOP' then
        __move_veritcal__(function()
          vim.cmd('terminal')
          terminal_bufnr = vim.api.nvim_get_current_buf()
          terminal_winid = vim.api.nvim_get_current_win()
        end, 'k')
    elseif pos == 'BOTTOM' then
        __move_veritcal__(function()
          vim.cmd('terminal')
          terminal_bufnr = vim.api.nvim_get_current_buf()
          terminal_winid = vim.api.nvim_get_current_win()
        end, 'j')
    end
  end
  _current_term_pos = pos
end
-- local function toggle_terminal_pane(pos)
--     local bufnr = nil
--
--     -- Check if there's an existing terminal buffer
--     for _, win in ipairs(vim.api.nvim_list_wins()) do 
--       local buf = vim.api.nvim_win_get_buf(win)
--       if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
--         bufnr = buf
--         break
--       end
--     end
--
--     if bufnr then
--       print("Removing " .. bufnr )
--       vim.api.nvim_buf_delete(bufnr, { force = true })
--       return
--     end
--
--     if not pos then 
--       print("pos is nil")
--       return 
--     end
--
--     if pos == 'LEFT' then
--       vim.cmd('vsplit')
--       vim.cmd('wincmd h')
--       vim.cmd('vertical resize 60' )
--       vim.cmd('terminal')
--       -- vim.cmd('wincmd l')
--     elseif pos == 'RIGHT' then
--       vim.cmd('vsplit')
--       vim.cmd('wincmd l')
--       vim.cmd('vertical resize 40')
--       vim.cmd('terminal')
--       -- vim.cmd('wincmd h')
--     elseif pos == 'TOP' then
--       vim.cmd('split')
--       vim.cmd('wincmd k')
--       vim.cmd('resize 10') 
--       vim.cmd('terminal')
--       -- vim.cmd('wincmd j')
--     elseif pos == 'BOTTOM' then
--       vim.cmd('split')
--       vim.cmd('wincmd j')
--       vim.cmd('resize 10')
--       vim.cmd('terminal')
--       -- vim.cmd('wincmd k')
--     end
--
--     _current_term_pos = pos
--   end


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
