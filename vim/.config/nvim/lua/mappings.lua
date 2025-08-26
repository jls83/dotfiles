local Keymap = require("utils.keymap")

vim.g.mapleader = " "

Keymap.inoremap("jk", "<C-[>")
Keymap.nnoremap("Y", "y$")

Keymap.nnoremap("<leader>y", ":%y*<CR>")
Keymap.vnoremap("<leader>y", '"*y')
Keymap.nnoremap("<leader>p", '"*p')

local opts = { silent = true, buffer = bufnr }

vim.keymap.set('n', '<leader>gd', function()
  return require('telescope.builtin').lsp_definitions()
end, opts)
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)

vim.keymap.set('n', 'zf', 'zcVzCzo', opts)

vim.keymap.set('n', '<leader>w<leader>w', function()
  local note = require("obsidian.daily").today()
  note:open()
end, opts)

vim.keymap.set('n', '<leader>wi', function()
  require("obsidian.commands.dailies")(nil, {})
end, opts)
