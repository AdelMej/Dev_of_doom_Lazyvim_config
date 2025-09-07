return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap.c")
      require("config.dap.python")
    end,
  },
  { "nvim-neotest/nvim-nio" },
  { "rcarriga/nvim-dap-ui" },
  { "theHamsta/nvim-dap-virtual-text" },
}
