--> nvim/lua/Setup/Plugins/NvimDAP.lua
--
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "julianolf/nvim-dap-lldb",
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup({

    })

    --> Opens dap-ui automatically when dap.continue() is ran.
    --> Closes automatically as well.
    dap.listeners.after.event_initialized["debug_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    --> Better breapoint icons
    vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
    vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''}) 


    local DAP = function(cmd) 
      return "<cmd> lua require('dap')."..cmd.."<CR>" 
    end
    local DAPWidget = function(cmd)
      return "<cmd> lua require('dap.ui.widgets')."..cmd.."<CR>"
    end

    -- vim.keymap.set('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
    vim.keymap.set('n', '<leader>d',  DAP("toggle_breakpoint()"))
    vim.keymap.set('n', '<leader>dc', DAP("continue()"))
    vim.keymap.set('n', '<leader>do', DAP("step_over()"))
    vim.keymap.set('n', '<leader>di', DAP("step_into()"))
    vim.keymap.set('n', '<leader>dr', DAP("repl_open()"))
    vim.keymap.set('n', '<leader>dl', DAP("run_last()"))
    vim.keymap.set({'n', 'v'}, '<leader>dh', DAPWidget("hover()") )

    vim.keymap.set('n', '<leader>dx', function()
      if dap.session() then
        print("->> Closing DAP-UI!")
        dapui.close()
      else
        print("->> DAP-UI is not initialized")
      end
    end)

  end
}
