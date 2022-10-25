-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

vim.api.nvim_set_hl(0, "TelescopeSelection", {link = "CursorLine"})
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {link = "TelescopeSelection"})

function my_buffer_window()
    require('telescope.builtin')
    .buffers({
        layout_strategy='bottom_pane',
        layout_config={prompt_position='bottom'},
        sort_mru = true,
        ignore_current_buffer = true,
    })
end

function my_lsp_references()
    require('telescope.builtin')
    .lsp_references({
        layout_strategy = 'vertical',
    })
end


vim.api.nvim_set_keymap('n', '<leader>b',
[[<cmd>lua my_buffer_window()<CR>]],
{ noremap = true, silent=true }
)

vim.api.nvim_set_keymap('n', '<leader>u',
[[<cmd>lua my_lsp_references()<CR>]],
{ noremap = true, silent=true }
)
