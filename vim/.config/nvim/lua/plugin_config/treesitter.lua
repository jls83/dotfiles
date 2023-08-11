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
        'markdown_inline',
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
        enable = false,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            node_decremental = "<BS>",
            -- scope_incremental = "grc",
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
