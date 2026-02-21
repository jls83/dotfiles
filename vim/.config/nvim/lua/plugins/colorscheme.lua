local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  enabled = true,
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

local zenbones = {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    init = function()
        -- vim.g.zenbones_darken_comments = 45
        --
        -- vim.g.zenbones_lighten_noncurrent_window = true
        -- vim.g.zenbones_darken_noncurrent_window = true
        -- vim.g.zenbones_darkness = "stark"
        -- vim.g.zenbones_italic_strings = false
        vim.g.zenbones = {
          darkness = "stark",
          italic_strings = false,
          lighten_cursor_line = 10,
          -- solid_line_nr = true,
        }
        vim.cmd.colorscheme('zenbones')
    end
}

local vague = {
  "vague2k/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("vague").setup({
      -- optional configuration here
      on_highlights = function(hl, colors)
        -- TODO: This still needs a tweak, but the background is way better
        local common = require("vague.groups.common")
        local common_colors = common.get_colors({colors = colors})

        local my_pmenu = { bg = "#21212a" }
        local my_match = { fg = colors.delta, bg = "#21212a", bold = true }
        local my_kind =  { fg = colors.comment, bg = "#21212a" }

        hl.BlinkCmpMenu = my_pmenu -- The completion menu window
        hl.BlinkCmpLabel = my_pmenu -- Label of the completion item
        hl.BlinkCmpSignatureHelp = my_pmenu -- Signature help window

        hl.BlinkCmpDocBorder = common_colors.NormalFloat -- The documentation window border
        hl.BlinkCmpMenuBorder = my_pmenu -- The completion menu window border
        hl.BlinkCmpSignatureHelpBorder = common_colors.NormalFloat -- The signature help window border

        hl.BlinkCmpKind = my_kind -- Kind icon/text of the completion item
        hl.BlinkCmpGhostText = common_colors.NonText -- Preview item with ghost text 

        hl.BlinkCmpLabelMatch = my_match -- (Currently unused) Label of the completion item when it matches the query
        hl.BlinkCmpLabelDeprecated = my_pmenu -- Deprecated label of the completion item
        hl.BlinkCmpLabelDetail = my_pmenu -- Label description of the completion item
        hl.BlinkCmpLabelDescription = my_pmenu -- Label description of the completion item

        hl.BlinkCmpMenuSelection = common_colors.PmenuSel -- The completion menu window selected item
        hl.BlinkCmpScrollBarThumb = common_colors.PmenuThumb -- The scrollbar thumb
        hl.BlinkCmpScrollBarGutter = common_colors.PmenuSbar -- The scrollbar gutter
        hl.BlinkCmpSource = my_pmenu -- Source of the completion item
        hl.BlinkCmpDoc = common_colors.NormalFloat -- The documentation window
        hl.BlinkCmpDocSeparator = common_colors.NormalFloat -- The documentation separator between doc and detail
        hl.BlinkCmpDocCursorLine = common_colors.Visual -- The documentation window cursor line
        hl.BlinkCmpSignatureHelp = common_colors.NormalFloat -- The signature help window
        hl.BlinkCmpSignatureHelpActiveParameter = common_colors.LspSignatureActiveParameter -- Active parameter of the signature help
      end,
    })
    vim.cmd("colorscheme vague")
  end
}

return vague
