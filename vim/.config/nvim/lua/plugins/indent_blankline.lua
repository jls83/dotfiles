return {
  "lukas-reineke/indent-blankline.nvim",
  version = "v2.20.8",
  config = function()
    local ibl = require("indent_blankline")

    ibl.setup({
      show_current_context = true,
      show_trailing_blankline_indent = false,
      char = "║",
      context_char = "┃",
      use_treesitter = true,
    })
  end,
}
