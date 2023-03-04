local Keymap = require("utils.keymap")
local ufo = require("ufo")
local palette = require('gruvbox.palette').colors

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, {chunkText, hlGroup})
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, {suffix, 'GruvboxAquaBold'})
  return newVirtText
end

ufo.setup({
  fold_virt_text_handler = handler,
  close_fold_kinds = {'imports', 'comment'},
})

-- TODO: This can cause the folds to freak out or some reason?
-- Keymap.nnoremap("zf", "zcVzCzo")

-- TODO: Explain
Keymap.nnoremap("zR", ufo.openAllFolds)
Keymap.nnoremap("zM", ufo.closeAllFolds)
