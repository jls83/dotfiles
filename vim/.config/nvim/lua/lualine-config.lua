local navic = require('nvim-navic')
local lualine = require('lualine')

vim.opt.showmode = false

lualine.setup({
    options = {
        theme = 'gruvbox',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_c = {
            'filename',
            { navic.get_location, cond = navic.is_available },
        },
        lualine_y = {},
    },
})
