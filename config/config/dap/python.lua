local dap = require("dap")
local dapui = require("dapui")

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return "/usr/bin/python" -- or virtualenv path
    end,
  },
}

-- UI setup is shared, so optional here
