local telescope = require('telescope')
local builtin = require('telescope.builtin')
require('entry-display-creator')

telescope.setup({
    defaults = {
        -- top, right, bottom, left, NW, NE, SE, SW
        borderchars = {'═', '│', '═', '│', '╒', '╕', '╛', '╘'},
        -- These are the true defaults:
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {['<c-d>'] = 'delete_buffer'},
            },
            layout_strategy='bottom_pane',
            layout_config={prompt_position='bottom'},
            sort_mru = true,
            ignore_current_buffer = true,
        },
    },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

function my_lsp_references()
    require('telescope.builtin')
    .lsp_references({
        layout_strategy = 'horizontal',
        show_line=false,
        entry_maker = makeEntryThing({}),
    })
end

vim.keymap.set('n', '<leader>b', builtin.buffers, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>u', my_lsp_references, {noremap = true, silent = true})
