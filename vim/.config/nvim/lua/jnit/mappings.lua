local Keymap = require("utils.keymap")

vim.g.mapleader = " "

Keymap.inoremap("jk", "<C-[>")
Keymap.nnoremap("Y", "y$")

Keymap.nnoremap("<leader>y", ":%y*<CR>")
Keymap.vnoremap("<leader>y", '"*y')
Keymap.nnoremap("<leader>p", '"*p')

-- TODO: This can cause the folds to freak out or some reason?
Keymap.nnoremap("zf", "zcVzCzo")
