return {
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Clojure items
  {
    "Olical/conjure",
    enabled = false,
    ft = { "clojure", "lua", "fennel" }
  },
  {
    "clojure-vim/vim-jack-in",
    enabled = true,
    ft = { "clojure" },
    dependencies = {
      "tpope/vim-dispatch",
      "radenling/vim-dispatch-neovim",
    },
  },
  {
    "guns/vim-sexp",
    enabled = true,
    ft = { "clojure", "fennel" }
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    enabled = true,
    ft = { "clojure", "fennel" }
  },
  -- For whatever reason, this plugin doesn"t like to be lazy-loaded. Keep it
  -- with the other Clojure plugins anyway, though.
  {
    "junegunn/rainbow_parentheses.vim",
    enabled = true,
  },

  -- Other language-specific items
  -- "mxw/vim-jsx",
  -- "cespare/vim-toml",

  -- Testing plugins
  {
    "jls83/galileo.nvim",
    enabled = false,
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-treehopper",
    enabled = false,
  },
  {
    "tpope/vim-dadbod",
    enabled = false,
  },
  {
    "andymass/vim-matchup",
    enabled = true,
  },
  {
    'Wansmer/treesj',
    enabled = true,
    keys = { '<leader>m', '<leader>j', '<leader>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    enabled = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    "tpope/vim-speeddating",
    enabled = true,
    event = "VeryLazy",
  },
  {
    "cshuaimin/ssr.nvim",
    enabled = false,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    enabled = vim.env.MACHINE_TYPE ~= 'glinux',
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "*",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   "BufReadPre " .. vim.fn.expand("~") .. "/obsidian_data/*.md",
    --   "BufNewFile " .. vim.fn.expand("~") .. "/obsidian_data/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "main",
          path = "~/obsidian_data",
        },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
      },
      daily_notes = {
        folder = "daily_notes",
      },
      ui = {
        ignore_conceal_warn = true,
      },
    },
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
  },
  {
    'MagicDuck/grug-far.nvim',
    enabled = false,
    config = function()
      require('grug-far').setup({
        engine = 'astgrep',
      });
    end
  },
  -- Forked plugins
  {
    "jls83/vim-oscyank",
    enabled = true,
    branch = "fix_visual_range"
  },
}
