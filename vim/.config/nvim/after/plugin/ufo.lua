local Keymap = require("utils.keymap")
local ufo = require("ufo")

ufo.setup()

-- TODO: This can cause the folds to freak out or some reason?
-- Keymap.nnoremap("zf", "zcVzCzo")

-- TODO: Explain
Keymap.nnoremap("zR", ufo.openAllFolds)
Keymap.nnoremap("zM", ufo.closeAllFolds)
