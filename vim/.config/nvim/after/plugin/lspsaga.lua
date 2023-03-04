require('lspsaga').setup({
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  symbol_in_winbar = {
    enable = "true",
    separator = "  ",
  },
  diagnostic = {
    enable = "false",
  },
})

vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', '<leader>ga', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
vim.keymap.set('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
