local indent_blankline = require('indent_blankline')

indent_blankline.setup {
    char = '¦',
    -- NOTE: Treesitter is being a pain in the butt?
    -- use_treesitter = true,
    show_first_indent_level = false,
    show_trailing_blankline_indent = true,
}
