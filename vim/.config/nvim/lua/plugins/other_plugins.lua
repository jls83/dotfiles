return {
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Clojure items
  {
    "Olical/conjure",
    enabled = true,
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
    enabled = true,
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
    enabled = true,
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
  -- Forked plugins
  {
    "jls83/vim-oscyank",
    enabled = false,
    branch = "fix_visual_range"
  },
}
