--> NuiTerm/Terminal/window.lua
--
local Debug = require("TA.NuiTerm.debug").DEBUG
local setup = require("TA.NuiTerm.setup")
local Popup = require("nui.popup")
local Layout = require("nui.layout")

local winConfig = setup.winConfig
vim.cmd([[
  highlight MyBorderNormal guifg=#ffffff guibg=#000000
  highlight MyBorderInsert guifg=#00ff00 guibg=#000000
  highlight MyBorderVisual guifg=#ff0000 guibg=#000000
]])

function oldPopupWindow(color)
  local window = Popup({
    relative = 'editor',
    size = winConfig.size,
    position = winConfig.position,
    border = {
      style = {
        top_left = "╭", top = "─", top_right = "╮",
        left = "│", right = "│",
        bottom_left = "╰", bottom = "─", bottom_right = "╯",
      },
      text = {
        top = "Terminal",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 100,
      winhighlight = "Normal:Normal,FloatBorder:" .. color,
    },
  })
  return window
end

local function GetTermSize()
  local width = vim.o.columns
  local height = vim.o.lines
  return width, height
end

function PopupWindow(color)
  -- Create a new buffer
  local bufnr = vim.api.nvim_create_buf(false, true)

  -- Set buffer options
  vim.bo[bufnr].bufhidden = "wipe"

  local width,height = GetTermSize()

  -- Define the window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = 20,
    row = height,
    col = 0,
    style = "minimal",
    border = "rounded",
  }

  -- Create the floating window
  local win_id = vim.api.nvim_open_win(bufnr, true, win_config)

  return bufnr, win_id
end

function GetMode()
  return vim.api.nvim_get_mode().mode
end

local TermWindow = {
  bufnr = nil,
  winid = nil,
  termid = nil,
  name = "Terminal",
  autocmdID = nil,
}

function TermWindow:Initialize(termid, winid, onHide)
  self.termid = termid
  self.winid = winid
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_win(winid)
  vim.bo[bufnr].bufhidden = "wipe"
  vim.api.nvim_set_current_buf(bufnr)
  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.api.nvim_buf_delete(bufnr, { force=true })
    end
  })
  self.bufnr = bufnr
  self:MountBindings(winid, onHide)
  return self
end
function TermWindow:CheckWinId(winid)
  if self.winid ~= winid then
    self.winid = winid
  end
end

function TermWindow:MountBindings(winid, onHide)
  self.autocmdID = vim.api.nvim_create_autocmd({"WinLeave"}, {
    buffer = self.bufnr,
    callback = function()
      if winid and vim.api.nvim_win_is_valid(winid) then
        vim.api.nvim_win_hide(winid)
        onHide()
      end
    end
  })
  vim.api.nvim_buf_set_keymap(
    self.bufnr,
    't',
    '<Esc>',
    [[<cmd>lua require('TA.NuiTerm').window:NormMode()<CR>]],
    {
      noremap = true,
      silent = true,
    }
  )
  vim.api.nvim_buf_set_keymap(
    self.bufnr,
    'n',
    'i',
    [[<cmd>lua require('TA.NuiTerm').window:TermMode()<CR>]],
    {
      noremap = true,
      silent = true,
    }
  )
  vim.api.nvim_buf_set_keymap(
    self.bufnr,
    'n',
    '<Esc>',
    [[<cmd>lua require('TA.NuiTerm').window:Hide()<CR>]],
    {
      noremap = true,
      silent = true,
    }
  )
end

local MainWindow = {
  -- window = nil,
  layout = nil,
  winid = nil,
  intialized = false,
  showing    = false,
  termWindows = {},
  totalTerms = 0,
  currentTerm = 0,
}
function MainWindow:new() return self end

function MainWindow:CreateTerm()
  if not self.layout or not self.layout.winid or not vim.api.nvim_win_is_valid(self.layout.winid) then
    return
  end
  local termid = self.currentTerm
  local newTerm = TermWindow:Initialize(termid, self.winid, function() self:Hide() end)

  self.termWindows[termid] = newTerm
  self.totalTerms = termid + 1
end

function MainWindow:GetCurrentTerm()
  return self.termWindows[self.currentTerm]
end


function MainWindow:TermMode()
  self:Hide()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, true, true), 'n', true)
  self:Show("MyBorderVisual")
end

function MainWindow:NormMode()
  self:Hide()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), 'n', true)
  self:Show("MyBorderNormal")
end


function MainWindow:Show(color)
  if not color then
    color = "MyBorderNormal"
  end

  local window = oldPopupWindow(color)
  local layout = Layout({
    position = winConfig.position,
    size = winConfig.size,
  }, Layout.Box({
    Layout.Box(window, { dir = "row", size = "100%" })
  }, { dir = "row", size = "100%"}))

  layout:mount()
  self.layout = layout
  self.winid = window.winid

  local currentTerm = self:GetCurrentTerm()
  if not currentTerm then
    self:CreateTerm()
    currentTerm = self:GetCurrentTerm()
  else
    currentTerm:MountBindings(self.winid, function() self:Hide() end)
    currentTerm:CheckWinId(self.winid) -- Safety -- make sure winid's match
  end
  vim.api.nvim_set_current_win(self.winid)
  vim.api.nvim_set_current_buf(currentTerm.bufnr)
  vim.api.nvim_win_set_buf(self.winid, currentTerm.bufnr)
end

function MainWindow:Hide()
    -- self.layout:hide()
    self.showing = false
end


-- Function to create a floating terminal window
local function create_floating_terminal_window()
  -- Create a new buffer
  local bufnr = vim.api.nvim_create_buf(false, true)

  -- Set buffer options
  vim.bo[bufnr].bufhidden = "wipe"

  local width,height = GetTermSize()

  -- Define the window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = 20,
    row = height,
    col = 0,
    style = "minimal",
    border = "rounded",
  }

  -- Create the floating window
  local win_id = vim.api.nvim_open_win(bufnr, true, win_config)

  -- Open a terminal in the buffer
  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end,
  })

  -- Return the window ID and buffer number
  return win_id, bufnr
end


function MainWindow:Toggle()
  -- create_floating_terminal_window()
  if self.showing then Debug("  SHOWING  ") else Debug(" NOTSHOWING ") end
  if not self.showing then
    self:Show()
    self.showing = true
  else
    self:Hide()
    self.showing = false
  end
end

return {
  MainWindow = MainWindow,
}
