local toggle_float = function()
  local win_id = vim.g.current_diag_window_id

  if (win_id ~= nil and vim.api.nvim_win_is_valid(win_id)) then
    vim.api.nvim_win_close(win_id, true)
    vim.g.current_diag_window_id = nil
  else
    _, win_id = vim.diagnostic.open_float()
    vim.g.current_diag_window_id = win_id
  end
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
})

local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
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
vim.keymap.set('n', '<leader>l', toggle_float, opts)

-- TODO: move this configuration out of the `plugins` directory.
return {}
