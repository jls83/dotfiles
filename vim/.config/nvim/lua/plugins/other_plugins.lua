return {
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Clojure items
  {
    "Olical/conjure",
    ft = { "clojure", "lua", "fennel" }
  },
  {
    "clojure-vim/vim-jack-in",
    ft = { "clojure" },
    dependencies = {
      "tpope/vim-dispatch",
      "radenling/vim-dispatch-neovim",
    },
  },
  {
    "guns/vim-sexp",
    ft = { "clojure", "fennel" }
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    ft = { "clojure", "fennel" }
  },
  -- For whatever reason, this plugin doesn"t like to be lazy-loaded. Keep it
  -- with the other Clojure plugins anyway, though.
  "junegunn/rainbow_parentheses.vim",

  -- Other language-specific items
  "mxw/vim-jsx",
  "cespare/vim-toml",

  -- Testing plugins
  {
    "jls83/galileo.nvim",
    event = "VeryLazy",
  },
  "mfussenegger/nvim-treehopper",
  "tpope/vim-dadbod",
  "andymass/vim-matchup",
  "nvim-telescope/telescope-ui-select.nvim",
  {
    'Wansmer/treesj',
    keys = { '<leader>m', '<leader>j', '<leader>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  "tpope/vim-speeddating",
  "cshuaimin/ssr.nvim",
  -- Forked plugins
  {
    "jls83/vim-oscyank",
    branch = "fix_visual_range"
  },
}
