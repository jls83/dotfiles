local ibl = require("indent_blankline")

ibl.setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
  char = "║",
  context_char = "┃",
  use_treesitter = true,
  use_treesitter_scope = true,
})
