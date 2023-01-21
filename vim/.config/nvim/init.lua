require('options')
require('mappings')
require('plugins')

if vim.env.MACHINE_TYPE == 'glinux' then
  vim.cmd('source', '$HOME/.config/nvim/google/my_google.vim')
  require('google.telescope-codesearch-config')
  require('google.lsp-config')
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
