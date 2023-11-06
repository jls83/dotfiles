return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
    -- "numToStr/Comment.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local navbuddy = require('nvim-navbuddy')

    navbuddy.setup();
  end,
}
