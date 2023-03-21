local gruvbox = require('gruvbox')
local palette = require('gruvbox.palette').colors

local telescope_borders = {
  fg = palette.dark2,
}

local telescope_titles = {
  fg = palette.faded_aqua,
  bg = nil,
  bold = true,
}

local cursorLineBg = palette.dark0

local color_overrides = {
  -- General overrides
  String = { italic = false },
  Operator = { italic = false },
  Folded = { fg = palette.aqua, bg = palette.dark0_soft, italic = true },
  FoldColumn = { fg = palette.gray, bg = cursorLineBg },
  CursorLine = { bg = cursorLineBg },
  CursorLineNr = { fg = palette.yellow, bg = cursorLineBg },
  SignColumn = { bg = cursorLineBg },

  -- Indent-Blanklines items
  IndentBlanklineContextChar = { fg = palette.faded_aqua },
  IndentBlanklineChar = { fg = palette.dark0 },

  -- Sign overrides
  GruvboxRedSign = { fg = palette.red, bg = cursorLineBg, reverse = false },
  GruvboxYellowSign = { fg = palette.yellow, bg = cursorLineBg, reverse = false },
  GruvboxBlueSign = { fg = palette.blue, bg = cursorLineBg, reverse = false },
  GruvboxAquaSign = { fg = palette.aqua, bg = cursorLineBg, reverse = false },
  GruvboxPurpleSign = { fg = palette.purple, bg = cursorLineBg, reverse = false },
  GruvboxOrangeSign = { fg = palette.orange, bg = cursorLineBg, reverse = false },

  -- Treesitter items
  ["@include.rust"] = { link = "Keyword" },
  ["@type.qualifier"] = { link = "Keyword" },
  ["@type.builtin"] = { link = "Keyword" },
  ["@namespace.cpp"] = { link = "Type" },

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

  NavicText = { fg = palette.light3 },
  NavicSeparator = { fg = palette.neutral_aqua },

  NavicIconsText = { link = "CmpItemKindText" },
  NavicIconsMethod = { link = "CmpItemKindMethod" },
  NavicIconsFunction = { link = "CmpItemKindFunction" },
  NavicIconsConstructor = { link = "CmpItemKindConstructor" },
  NavicIconsField = { link = "CmpItemKindField" },
  NavicIconsClass = { link = "CmpItemKindClass" },
  NavicIconsInterface = { link = "CmpItemKindInterface" },
  NavicIconsModule = { link = "CmpItemKindModule" },
  NavicIconsProperty = { link = "CmpItemKindProperty" },
  NavicIconsValue = { link = "CmpItemKindValue" },
  NavicIconsEnum = { link = "CmpItemKindEnum" },
  NavicIconsKeyword = { link = "CmpItemKindKeyword" },
  NavicIconsSnippet = { link = "CmpItemKindSnippet" },
  NavicIconsFile = { link = "CmpItemKindFile" },
  NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
  NavicIconsConstant = { link = "CmpItemKindConstant" },
  NavicIconsStruct = { link = "CmpItemKindStruct" },
  NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },

  UfoCursorFoldedLine = { bg = cursorLineBg, italic = true },
}

gruvbox.setup({
  contrast = '',
  transparent_mode = true,
  invert_selection = true,
  overrides = color_overrides,
})
vim.cmd([[colorscheme gruvbox]])

-- Set some explicit overrides as well.
vim.api.nvim_set_hl(0, 'WinBar', { bg = nil });
vim.api.nvim_set_hl(0, 'Folded', { fg = palette.gray, bg = palette.dark0_soft, italic = true })
