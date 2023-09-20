local lsp_lines = require('lsp_lines')
lsp_lines.setup()

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    only_current_line = true,
  },
})

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

local opts = { silent = true }

local goto_wrap = function(fn)
  return function()
    fn({ float = false })
  end
end

vim.keymap.set('n', '[g', goto_wrap(vim.diagnostic.goto_prev), opts)
vim.keymap.set('n', ']g', goto_wrap(vim.diagnostic.goto_next), opts)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
  }
)

