local Keymap = require('utils.keymap')

return {
  "stevearc/oil.nvim",
  enabled = true,
  config = function()
    local oil = require("oil")
    oil.setup({
      view_options = {
        show_hidden = true,
      },
    })

    Keymap.nnoremap("-", function()
      oil.open()
    end)
    Keymap.nnoremap("_", function()
      vim.cmd('vsplit')
      oil.open()
    end)
  end
}
