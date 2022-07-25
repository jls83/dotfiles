local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    -- Essentially only for rust_analyzer sources that jump to the middle of the menu for
    -- whatever reason!
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        -- NOTE: I'm not sure if I need a `confirm` mapping, but FOR SURE it's not <CR>
        -- ['<CR>'] = cmp.mapping.confirm({
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = true,
        -- }),
    },
    sources = cmp.config.sources({
        -- NOTE: Order here determines priority in completion menu
        {
            name = 'nvim_lsp',
            max_item_count = 10,
        },
        {
            name = 'ultisnips',
            keyword_length = 2,
            max_item_count = 10,
        },
        {
            name = 'buffer',
            max_item_count = 10,
            option = {
                -- Add all visible buffers as a completion source
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end,
            },
        },
        {
            name = 'path',
            max_item_count = 10,
        },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 40,
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

