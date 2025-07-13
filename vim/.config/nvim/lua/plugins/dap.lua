return {
  {
    "mfussenegger/nvim-dap",
    enabled = true,
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = true,
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap" },
  },
}
