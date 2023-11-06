return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require('lualine')

    vim.opt.showmode = false

    lualine.setup({
      options = {
        theme = 'gruvbox',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_c = {
          'filename',
        },
      },
    })
  end,
}
