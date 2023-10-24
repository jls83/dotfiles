local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local base_plugins = {
  "wbthomason/packer.nvim",

  -- Appearance plugins
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
  "nvim-lualine/lualine.nvim",

  -- Editing plugins
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-vinegar",
  { "phaazon/hop.nvim", branch = "v2" },
  {
    "kylechui/nvim-surround",
    -- TODO: Move config
    event = "VeryLazy",
    config = true,
    -- require("nvim-surround").setup({})
    -- end
  },

  -- Git plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- fzf plugins
  {
    "junegunn/fzf",
    build = function() vim.fn["fzf#install"]() end
  },
  "junegunn/fzf.vim",

  -- LSP, Completion, and Snippets plugins
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  "onsails/lspkind-nvim",
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
  },
  "SmiteshP/nvim-navic",
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },

  -- Telescope items
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  "kyazdani42/nvim-web-devicons",

  -- Other items
  "nvim-treesitter/playground",
}

local language_specific_plugins = {
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
  {
    "nvim-treesitter/nvim-treesitter",
    -- branch = "vimwiki_compat",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
}

local testing_plugins = {
  "jls83/galileo.nvim",
  "mfussenegger/nvim-dap",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  "lukas-reineke/indent-blankline.nvim",
  {
    "mfussenegger/nvim-treehopper",
    dependencies = "mfussenegger/nvim-treehopper",
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      -- "numToStr/Comment.nvim",
      "nvim-telescope/telescope.nvim",
    }
  },
  "tpope/vim-dadbod",
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  "andymass/vim-matchup",
}

local forked_plugins = {
  {
    "jls83/nvim-ufo",
    branch = "use_default_hl_group",
    dependencies = "kevinhwang91/promise-async",
  },
  {
    "jls83/vimwiki",
    branch = "mixed_backlinks"
  },
  {
    "jls83/vim-oscyank",
    branch = "fix_visual_range"
  },
}

local plugin_arrays = {
  base_plugins,
  language_specific_plugins,
  testing_plugins,
  forked_plugins,
}

if vim.env.MACHINE_TYPE == "glinux" then
  table.insert(plugin_arrays, require("google.plugins"))
end

local result = {}
for _, plugins in ipairs(plugin_arrays) do
  for _, v in ipairs(plugins) do
    table.insert(result, v)
  end
end

require("lazy").setup(result)
