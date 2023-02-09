local lspsaga = require('lspsaga')

lspsaga.setup({})
vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', '<leader>ga', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
vim.keymap.set('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
