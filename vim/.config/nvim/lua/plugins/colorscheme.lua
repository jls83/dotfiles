local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local gruvbox = require('gruvbox')
    local palette = require('gruvbox').palette

    local telescope_bg = palette.dark0_hard
    local telescope_accent = palette.faded_aqua
    local telescope_shadow = palette.dark2

    local telescope_borders = {
      fg = telescope_shadow,
      bg = telescope_bg,
    }

    local telescope_titles = {
      fg = telescope_accent,
      bg = telescope_bg,
      bold = true,
    }

    local cursorLineBg = palette.dark0
    local fold_line_bg = palette.dark0_soft

    local color_overrides = {
      -- General overrides
      -- NormalFloat = { bg = palette.dark0_soft },
      Directory = { link = "GruvboxBlueBold" },
      Normal = { bg = "#000000" },
      String = { italic = false },
      Operator = { italic = false },
      Folded = { fg = palette.aqua, bg = fold_line_bg, italic = true },
      FoldColumn = { fg = palette.gray, bg = "#000000" },
      OtherWeirdness = { fg = palette.gray, bg = fold_line_bg },
      CursorLine = { bg = cursorLineBg },
      CursorLineNr = { fg = palette.yellow, bg = cursorLineBg },
      CursorLineFold = { fg = palette.gray, bg = cursorLineBg },
      CursorLineSign = { fg = palette.gray, bg = cursorLineBg },
      WinSeparator = { fg = palette.faded_aqua },

      -- Indent-Blanklines items
      IndentBlanklineContextChar = { fg = palette.faded_aqua },
      IndentBlanklineChar = { fg = palette.dark0 },

      -- Treesitter items
      ["@include.rust"] = { link = "Keyword" },
      ["@type.qualifier"] = { link = "Keyword" },
      ["@type.builtin"] = { link = "Keyword" },
      ["@namespace.cpp"] = { link = "Type" },

      -- Telescope items
      -- Part of the need for explicit overrides is an upstream issue in
      -- gruvbox.nvim.
      TelescopePromptBorder = {
        fg = telescope_accent,
        bg = telescope_bg
      },
      TelescopePromptTitle = {
        fg = telescope_bg,
        bg = telescope_accent,
        bold = true,
      },
      TelescopePromptNormal = { fg = palette.light1, bg = telescope_bg },
      TelescopePromptPrefix = { fg = palette.bright_red },

      TelescopePreviewBorder = telescope_borders,
      TelescopePreviewTitle = telescope_titles;

      TelescopeResultsBorder = telescope_borders,
      TelescopeResultsTitle = telescope_titles;

      TelescopeSelection = {
        fg = palette.light1,
        bg = telescope_shadow,
      },

      TelescopeSelectionCaret = {
        fg = palette.bright_green,
        bg = telescope_shadow,
      },

      TelescopeResultsDiffAdd = { fg = palette.bright_green },
      TelescopeResultsDiffChange = { fg = palette.neutral_yellow },
      TelescopeResultsDiffDelete = { fg = palette.bright_red },

      TelescopeNormal = {
        bg = telescope_bg,
        fg = palette.light2,
      },

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

    }

    gruvbox.setup({
      contrast = '',
      transparent_mode = false,
      invert_selection = false,
      overrides = color_overrides,
    })
    vim.cmd([[colorscheme gruvbox]])

    -- Set some explicit overrides as well.
    vim.api.nvim_set_hl(0, 'WinBar', { bg = nil });
    vim.api.nvim_set_hl(0, 'WinBarNC', { bg = nil });
  end,
}

-- example lazy.nvim install setup
local lackluster = {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        -- vim.cmd.colorscheme("lackluster")
        vim.cmd.colorscheme("lackluster-hack") -- my favorite
        -- vim.cmd.colorscheme("lackluster-mint")
    end,
}

return gruvbox
