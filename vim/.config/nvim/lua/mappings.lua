local Keymap = require("utils.keymap")

vim.g.mapleader = " "

Keymap.inoremap("jk", "<C-[>")
Keymap.nnoremap("Y", "y$")

Keymap.nnoremap("<leader>y", ":%y*<CR>")
Keymap.vnoremap("<leader>y", '"*y')
Keymap.nnoremap("<leader>p", '"*p')

Keymap.nnoremap("-", '<CMD>Oil<CR>')
Keymap.nnoremap("_", ':vsp<CR><CMD>Oil<CR>')
