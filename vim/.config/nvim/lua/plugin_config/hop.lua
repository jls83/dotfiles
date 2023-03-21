local Keymap = require('utils.keymap')

local hop = require('hop')
hop.setup()

local directions = require('hop.hint').HintDirection

Keymap.nnoremap(
  '<leader><leader>f',
  function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
  end,
  { remap = true }
)
Keymap.nnoremap(
  '<leader><leader>F',
  function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
  end,
  { remap = true }
)
Keymap.nnoremap(
  '<leader><leader>t',
  function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
  end,
  { remap = true }
)
Keymap.nnoremap(
  '<leader><leader>T',
  function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
  end,
  { remap = true }
)

Keymap.omap(
  'm',
  [[:<C-U>lua require('tsht').nodes()<CR>]]
)

-- TODO: Ehhhhh
vim.cmd([[omap <silent> m :<C-U>lua require('tsht').nodes()<CR>]])
vim.cmd([[xnoremap <silent> m :lua require('tsht').nodes()<CR>]])
