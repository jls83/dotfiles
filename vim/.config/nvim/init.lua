local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('options')
require('mappings')

local lazy = require('lazy')

lazy.setup('plugins')

for _, viml_file in ipairs({
  'lua/plugin_config/fugitive.vim',
}) do
  vim.cmd('source $HOME/.config/nvim/' .. viml_file)
end

if vim.env.MACHINE_TYPE == 'glinux' then
  vim.cmd('source $HOME/.config/nvim/google/my_google.vim')
  -- Some config remains outside Lazy's files
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
