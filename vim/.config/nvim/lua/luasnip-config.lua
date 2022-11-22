local luasnip = require('luasnip')
local snippet = luasnip.s
local text = luasnip.text_node
local insert = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
})

local vwhead = snippet("vwhead", fmt("# {}\n\n## Today's Activity\n* ", { os.date("%Y-%m-%d (%A)") }))

local review_snip = snippet(
    "creview",
    {
        text("Reviewed cl/"),
        insert(1), -- CL number
        text(" for "),
        insert(2), -- LDAP
        text("@"),
    })

luasnip.add_snippets("all", {
    vwhead,
    review_snip,
})

-- Keymaps stolen from TJ DeVries
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
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
