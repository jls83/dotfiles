return {
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Clojure items
  {
    "Olical/conjure",
    ft = { "clojure", "lua" }
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
    ft = { "clojure" }
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    ft = { "clojure" }
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

  -- Forked plugins
  {
    "jls83/vim-oscyank",
    branch = "fix_visual_range"
  },
}
