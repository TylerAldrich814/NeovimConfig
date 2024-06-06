--> nvim/lua/DAP/python.lua
--
local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = os.getenv("/opt/homebrew/bin/python3"),
  args = { "-m", "debugpy.adapter" }
}

dap.configurations.python = {
  {
    type    = 'python',
    request = 'launch',
    name    = 'Launch File',
    program = "${file}",
    pythonPath = function()
      return '/opt/homebrew/bin/python3'
    end
  }
}
