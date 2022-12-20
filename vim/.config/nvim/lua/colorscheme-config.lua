local gruvbox = require('gruvbox')
local palette = require('gruvbox.palette')

gruvbox.setup({
    contrast = '',
    transparent_mode = true,
    overrides = {
        SignColumn = { bg = palette.dark1 },
        String = { italic = false },
        ["@include.rust"] = { link = "Keyword" },
    },
})
vim.cmd([[colorscheme gruvbox]])
