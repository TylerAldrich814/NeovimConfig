--> NuiTerm/Terminal/window.lua
--
local setup = require("TA.NuiTerm.setup")
local Popup = require("nui.popup")

local TermWindow = {
  bufnr     = nil,
  winid     = nil,
  termId    = nil,
  name      = "Terminal",
  autocmdID = nil,
}


function TermWindow:MountBindings(winId, hideCb)
  self.autocmdID = vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    buffer = self.bufnr,
    callback = function()
      if winId and vim.api.nvim_win_is_valid(winId) then
        vim.api.nvim_win_hide(winId)
        hideCb()
      end
    end
  })
end

function TermWindow:UnmountBindings()
  vim.api.nvim_del_autocmd(self.autocmdID)
end

function TermWindow:Initialize(termId, winId, hideCb)
  self.termId = termId
  self.winid = winId
  local bufnr  = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_win(winId)
  vim.api.nvim_set_current_buf(bufnr)

  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  })
  self.bufnr = bufnr
  self:MountBindings(winId, hideCb)
  return self
end


local MainWindow = {
 window      = nil,
 initialized = false,
 showing     = false,
 termWindows = {},
 totalTerms  = 0,
 currentTerm = 0,
}

function MainWindow:new()
  return self
end

function MainWindow:GetCurrentTerm()
  return self.termWindows[self.currentTerm]
end
function MainWindow:GetWinId()
  return self.window.winid
end

function MainWindow:Create()
  if self.initialized then
    return self:Show()
  end
  local winConfig = setup.winConfig
  self.window = Popup({
    position = winConfig.position,
    size     = winConfig.size,
    relative = 'editor',
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
      winblend = 90,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  })
  self.window:mount()
  self:CreateTerm()
  MainWindow:Show()
end

function MainWindow:CreateTerm()
  if not self.window or not self.window.winid or not vim.api.nvim_win_is_valid(self.window.winid) then
    return
  end
  local termid = self.totalTerms
  local newTerm = TermWindow:Initialize(termid, self.window.winid, function() self:Hide() end)
  newTerm:MountBindings()
  self.termWindows[termid] = newTerm
  self.totalTerms = termid+1

  for _, mode in ipairs({'n', 't'}) do
    vim.api.nvim_buf_set_keymap(
      newTerm.bufnr,
      mode,
      '<Esc>',
      [[<cmd>lua require('TA.NuiTerm').window:Toggle()<CR>]],
      {
        noremap = true,
        silent  = true,
      }
    )
  end
end


function MainWindow:Show()
  self.window:show()
  local currentTerm = self:GetCurrentTerm()
  vim.api.nvim_set_current_win(self.window.winid)
  vim.api.nvim_set_current_buf(currentTerm.bufnr)

  vim.api.nvim_win_set_buf(self:GetWinId(), currentTerm.bufnr)
  vim.cmd('startinsert')
  self.showing = true

  if not self.initialized then
    print("Initialize = true")
    self.initialized = true
  else
    print("REMOUNTING -- " )
    for id, term in pairs(self.termWindows) do
      print("MountBindings "..id)
      term:MountBindings(self.window.winid, function() self:Hide() end)
    end
  end
end

function MainWindow:Hide()
  self.window:hide()
  self.showing = false
end

function MainWindow:Toggle()
  if not self.initialized  then
    print("CREATE")
    self:Create()
    return
  end
  if self.showing then
    print("HIDE")
    self:Hide()
  else
    print("SHOW")
    self:Show()
  end
end

return {
  MainWindow = MainWindow
}
