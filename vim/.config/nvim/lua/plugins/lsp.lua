return {
  "onsails/lspkind-nvim",
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      if vim.env.MACHINE_TYPE == 'glinux' then
        mason_lspconfig.setup({
          automatic_enable = {
            exclude = {
              'clangd',
              'pyright',
            },
          },
        })
      else
        mason_lspconfig.setup({})
      end
    end,
  },
}
