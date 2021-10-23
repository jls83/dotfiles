local cmp = require('cmp')
local lspkind = require('lspkind')

-- local tab_complete = function(fallback)
--     if cmp.visible() then
--         cmp.mapping.select_next_item()
--     else
--         fallback()
--     end
-- end

-- local shift_tab_complete = function(fallback)
--     if cmp.visible() then
--         cmp.mapping.select_prev_item()
--     else
--         fallback()
--     end
-- end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    sources = cmp.config.sources({
        -- NOTE: Order here determines priority in completion menu
        { name = 'nvim_lsp'},
        { name = 'ultisnips', keyword_length = 2 },
        { name = 'buffer' },
        { name = 'path' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            with_text = true, 
            menu = {
                nvim_lsp = "[LSP]",
                ultisnips = "[UltiSnips]",
                buffer = "[Buffer]",
                path = "[Path]",
            },
        }),
    },
    experimental = {
        native_menu = false,
    },
})

