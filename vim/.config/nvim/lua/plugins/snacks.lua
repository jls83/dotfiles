return {
  "folke/snacks.nvim",
  -- enabled = true,
  opts = {
    indent = {
      scope = {
        char = "▎",
        underline = true,
        hl = "Keyword",
      },
      chunk = {
        enabled = true,
        hl = "Keyword",
        char = {
          vertical = "┃",
          corner_top = "┎",
          corner_bottom = "┖",
        },
      },
      animate = {
        enabled = false,
        easing = "inOutQuart",
        -- duration = {
        --   step = 50,
        -- },
      },
    },
    -- statuscolumn = {
    --   enabled = false,
    --   folds = {
    --     open = true,
    --   },
    -- },
  },
}
