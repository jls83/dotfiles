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

-- TODO: Consider toggling `virtual_text` on/off as well.
-- Toggles between `only_current_line` and fully off.
local lsp_lines_toggle = function()
  local current_state = vim.diagnostic.config().virtual_lines
  if (current_state == false) then
    vim.diagnostic.config({virtual_lines = { only_current_line = true }})
  else
    vim.diagnostic.config({virtual_lines = false})
  end
end

-- Toggles between all diagnostics and fully off.
local lsp_lines_full_toggle = function()
  local current_state = vim.diagnostic.config().virtual_lines
  if (current_state == true) then
    vim.diagnostic.config({virtual_lines = { only_current_line = true }})
  else
    vim.diagnostic.config({virtual_lines = true})
  end
end

vim.keymap.set('n', '<leader>l', lsp_lines_toggle, opts)
vim.keymap.set('n', '<leader>L', lsp_lines_full_toggle, opts)
