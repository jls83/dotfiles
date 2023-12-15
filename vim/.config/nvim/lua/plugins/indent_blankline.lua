return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    scope = {
      -- Left-aligned for niceness with the underline.
      char = "▎",
      highlight = "IndentBlanklineContextChar",
      show_start = true,
      show_end = true,
    },
    indent = {
      char = "║",
      highlight = "IndentBlanklineChar",
    }
  },
}
