local navic = require('nvim-navic')

navic.setup({
  highlight = true,
  separator = "  ",
})

local get_winbar_text = function()
  -- get the textoff for the buffer
  local prefix_length = 2
  for _, b in pairs(vim.fn.getwininfo()) do
    if b.bufnr == vim.fn.bufnr('%') then
      prefix_length = b.textoff
      break
    end
  end

  local prefix = string.rep(" ", prefix_length)

  return prefix .. "%{%v:lua.require'nvim-navic'.get_location()%}"
end

vim.opt.winbar = get_winbar_text()
