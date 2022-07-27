local luasnip = require('luasnip')
local snippet = luasnip.s
local t = luasnip.text_node

luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
})

luasnip.add_snippets("all", {
    snippet("vwdate", t(os.date("%Y-%m-%d (%A)")));
})

-- Keymaps stolen from TJ DeVries
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/luasnip-config.lua<CR>")
