vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'

vim.opt.list = true
vim.opt.listchars:append("tab:▸ ")
vim.opt.listchars:append("eol:¬")

vim.opt.matchpairs:append("<:>")

vim.opt.mouse = ""

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldtext = 'v:lua.require("utils.misc").foldText()'
-- vim.opt.fillchars= 'fold: '
-- TODO: Explain
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.g.python3_host_prog = '$HOME/.virtualenvs/py3nvim/bin/python'
vim.g.node_host_prog = '/usr/local/bin/neovim-node-host'

vim.g.markdown_syntax_conceal = 0
vim.g.vim_json_conceal = 0

vim.opt.completeopt = {"menuone", "noselect"}
vim.opt.shortmess:append("c")

-- TODO: explain and/or move to a plugin file
vim.g['conjure#extract#tree_sitter#enabled'] = true
vim.g['netrw_bufsettings'] ='noma nomod nobl nowrap ro nu rnu'

vim.opt.fillchars = {
  vert = '║',
  horiz = '═',
  horizup = '╩',
  horizdown = '╦',
  vertleft = '╣',
  vertright = '╠',
  verthoriz = '╬',
}

-- Enable global statusline
vim.opt.laststatus = 3
