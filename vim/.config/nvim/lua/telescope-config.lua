require('telescope').setup({
    pickers = {
        buffers = {
            sort_lastused = true,
        },
    },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

function my_buffer_window()
    require('telescope.builtin')
        .buffers({
            layout_strategy='bottom_pane',
            layout_config={prompt_position='bottom'},
        })
end

vim.api.nvim_set_keymap('n', '<leader>b',
  [[<cmd>lua my_buffer_window()<CR>]],
  { noremap = true, silent=true }
)
