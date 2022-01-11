local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev({})<CR>', opts)
vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next({})<CR>', opts)
