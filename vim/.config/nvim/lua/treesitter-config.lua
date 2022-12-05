require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'clojure',
        'cpp',
        'dart',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        -- 'proto',
        'python',
        'rust',
        'scss',
        -- 'sql',
        'typescript',
        'vim',
    },
    indent = { enable = false },
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    -- textobjects = {
    --     enable = true,
    --     set_jumps = true,
    --     goto_next_start = {
    --         ["]m"] = "@function.outer",
    --         ["]]"] = { query = "@class.outer", desc = "Next class start" },
    --     }
    -- },
})
