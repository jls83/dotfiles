return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      modules = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
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
      matchup = {
        enable = true,
        disable_virtual_text = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
          },
        },
      },
    })
  end,
}
