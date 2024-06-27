--> nvim/lua/DAP/lldb.lua
--
local dap = require("dap")

-->   Available log levels:
--       TRACE
--       DEBUG
--       INFO
--       WARN
--       ERROR

local function get_lldb()
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Linux" then
    return "/usr/bin/lldb"
  elseif os_name == "Darwin" then
    return "/opt/homebrew/opt/llvm/bin/lldb-dap"
  else
    error("Unknown operating System.", 1)
  end
end
get_lldb()

dap.set_log_level('ERROR')

dap.adapters.lldb = {
  type    = "executable",
  command = get_lldb(),
  name    = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/build/', 'file')
    end,
    stopOnEntry = false,
    args = {},
  }
}

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {
  {
    name    = "Launch",
    type    = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/target/debug/main', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    initCommands = function()
      local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
      local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/ext/lldb_lookup.py"'
      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

      local commands = {}
      local file = io.open(commands_file, 'r')
      if file then
        for line in file:lines() do
          table.insert(commands, line)
        end
        file:close()
      end
      table.insert(commands, 1, script_import)
      return commands
    end
  }
}

