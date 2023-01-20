local hop = require('hop')
hop.setup()

local directions = require('hop.hint').HintDirection

vim.keymap.set('n', '<leader><leader>f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { remap = true })
vim.keymap.set('n', '<leader><leader>F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, { remap = true })
vim.keymap.set('n', '<leader><leader>t', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('n', '<leader><leader>T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
end, { remap = true })
