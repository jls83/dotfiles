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
    enabled = false,
    ft = { "clojure" },
    dependencies = {
      "tpope/vim-dispatch",
      "radenling/vim-dispatch-neovim",
    },
  },
  {
    "guns/vim-sexp",
    enabled = false,
    ft = { "clojure", "fennel" }
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    enabled = false,
    ft = { "clojure", "fennel" }
  },
  -- For whatever reason, this plugin doesn"t like to be lazy-loaded. Keep it
  -- with the other Clojure plugins anyway, though.
  {
    "junegunn/rainbow_parentheses.vim",
    enabled = false,
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
    enabled = false,
  },
  {
    'Wansmer/treesj',
    enabled = false,
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
    enabled = false,
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
