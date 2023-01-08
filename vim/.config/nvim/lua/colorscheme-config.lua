local gruvbox = require('gruvbox')
local palette = require('gruvbox.palette')

local telescope_borders = {
  fg = palette.dark2,
}

local telescope_titles = {
  fg = palette.faded_aqua,
  bg = nil,
  bold = true,
}

local color_overrides = {
  -- General overrides
  SignColumn = { bg = palette.dark1 },
  String = { italic = false },
  Operator = { italic = false },

  -- Treesitter items
  ["@include.rust"] = { link = "Keyword" },
  ["@type.qualifier"] = { link = "Keyword" },
  ["@type.builtin"] = { link = "Keyword" },

  -- Telescope items
  -- Part of the need for explicit overrides is an upstream issue in
  -- gruvbox.nvim.
  TelescopePromptBorder = { fg = palette.faded_aqua },
  TelescopePromptTitle = {
    fg = palette.dark0_hard,
    bg = palette.faded_aqua,
    bold = true,
  },
  TelescopePromptNormal = { fg = palette.light1 },
  TelescopePromptPrefix = { fg = palette.bright_red },

  TelescopePreviewBorder = telescope_borders,
  TelescopePreviewTitle = telescope_titles;

  TelescopeResultsBorder = telescope_borders,
  TelescopeResultsTitle = telescope_titles;

  TelescopeSelection = {
    fg = palette.light1,
    bg = palette.dark1,
  },

  TelescopeSelectionCaret = {
    fg = palette.bright_green,
    bg = palette.dark1,
  },

  TelescopeResultsDiffAdd = { fg = palette.bright_green },
  TelescopeResultsDiffChange = { fg = palette.neutral_yellow },
  TelescopeResultsDiffDelete = { fg = palette.bright_red },
}

gruvbox.setup({
  contrast = '',
  transparent_mode = true,
  invert_selection = true,
  overrides = color_overrides,
})
vim.cmd([[colorscheme gruvbox]])
