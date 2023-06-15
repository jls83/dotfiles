require('options')
require('mappings')
require('plugins')

require('plugin_config.cmp')
require('plugin_config.colorscheme')
require('plugin_config.diagnostic')
require('plugin_config.fidget')
require('plugin_config.hop')
require('plugin_config.indent_blankline')
require('plugin_config.lsp')
require('plugin_config.lualine')
require('plugin_config.luasnip')
require('plugin_config.navic')
require('plugin_config.navbuddy')
require('plugin_config.telescope')
require('plugin_config.treesitter')
require('plugin_config.ufo')

for _, viml_file in ipairs({
  'lua/plugin_config/fugitive.vim',
}) do
  vim.cmd('source $HOME/.config/nvim/' .. viml_file)
end

local Keymap = require("utils.keymap")

if vim.env.MACHINE_TYPE == 'glinux' then
  vim.cmd('source $HOME/.config/nvim/google/my_google.vim')
  require('google.plugin_config.lsp')
  require('google.plugin_config.dap')
  require('google.plugin_config.telescope')
end

local numbertoggle_group = vim.api.nvim_create_augroup("numbertoggle", {
  clear = true
})

vim.api.nvim_create_autocmd(
  {"BufEnter", "FocusGained", "InsertLeave", "WinEnter"},
  {
    pattern = "*",
    command = "if &nu | set rnu | endif",
    group = numbertoggle_group,
  }
)

vim.api.nvim_create_autocmd(
  {"BufLeave", "FocusLost", "InsertEnter", "WinLeave"},
  {
    pattern = "*",
    command = "if &nu | set nornu | endif",
    group = numbertoggle_group,
  }
)

-- TODO: Should this live here?
vim.g.vimwiki_list = {
  {
    path = "~/vimwiki",
    syntax = "markdown",
    ext = ".md",
  },
}
vim.g.vimwiki_global_ext = 0

-- Add a leading '../' to links to allow for linking to main wiki articles from
-- the diary.
Keymap.nnoremap("<leader>wl", "0f[wi../<ESC>")

vim.api.nvim_create_autocmd(
  {"VimEnter"},
  {
    pattern = "*",
    command = "let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']",
  }
)
