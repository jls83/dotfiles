local gruvbox = require('gruvbox')
local palette = require('gruvbox.palette')

gruvbox.setup({
    contrast = '',
    transparent_mode = true,
    invert_selection = true,
    overrides = {
        SignColumn = { bg = palette.dark1 },
        String = { italic = false },
        Operator = { italic = false },
        ["@include.rust"] = { link = "Keyword" },
        ["@type.qualifier"] = { link = "Keyword" },
        ["@type.builtin"] = { link = "Keyword" },
    },
})
vim.cmd([[colorscheme gruvbox]])
