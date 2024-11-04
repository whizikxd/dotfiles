return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.adapters.gdb = {
        id = "gdb",
        type = "executable",
        command = "gdb",
        args = { "--quiet", "--interpreter=dap" },
    }

    dap.configurations.c = {
      {
        name = "run(gdb)",
        type = "gdb",
        request = "launch",
        program = function()
          local path = vim.fn.input({
              prompt = "run: ",
              default = vim.fn.getcwd() .. "/",
              completion = "file",
          })

          return (path and path ~= "") and path or dap.ABORT
        end,
      },
      {
        name = "args(gdb)",
        type = "gdb",
        request = "launch",
        program = function()
          local path = vim.fn.input({
              prompt = "run: ",
              default = vim.fn.getcwd() .. "/",
              completion = "file",
          })

          return (path and path ~= "") and path or dap.ABORT
        end,
        args = function()
          local args_input = vim.fn.input("args: ")
          return vim.split(args_input, " ", true) or dap.ABORT
        end,
      },
    }
    dap.configurations.cpp = dap.configurations.c;

    dapui.setup({
      layouts = {
        {
          elements = { "watches" },
          size = 40,
          position = "right",
        },
      }
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.keymap.set('n', '<F5>', dap.continue, { desc = "Start/Continue debugging" })
    vim.keymap.set('n', '<F10>', dap.step_over, { desc = "Step Over" })
    vim.keymap.set('n', '<F11>', dap.step_into, { desc = "Step Into" })
    vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Step Out" })
    vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Set Conditional Breakpoint" })
    vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = "Open REPL" })
    vim.keymap.set('n', '<Leader>du', dapui.toggle, { desc = "Toggle DAP UI" })
  end
}
