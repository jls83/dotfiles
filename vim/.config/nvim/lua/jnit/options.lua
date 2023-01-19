vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.signcolumn = true

vim.opt.list = true
vim.opt.listchars:append("tab:▸ ")
vim.opt.listchars:append("eol:¬")

vim.opt.matchpairs:append("<:>")

vim.opt.mouse = false

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
