local base_plugins = {
  'wbthomason/packer.nvim',

  -- Appearance plugins
  {
    'ellisonleao/gruvbox.nvim',
  },
  'nvim-lualine/lualine.nvim',

  -- Editing plugins
  'tpope/vim-commentary',
  'tpope/vim-repeat',
  'tpope/vim-vinegar',
  { 'phaazon/hop.nvim', branch = 'v2' },
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    -- TODO: Move config
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- Git plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- fzf plugins
  { 'junegunn/fzf', run = function() vim.fn["fzf#install"]() end },
  'junegunn/fzf.vim',

  -- LSP, Completion, and Snippets plugins
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'onsails/lspkind-nvim',
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
  },
  'SmiteshP/nvim-navic',
  'williamboman/mason.nvim',
  {
    'williamboman/mason-lspconfig.nvim',
    requires = { 'williamboman/mason.nvim' },
  },

  -- Telescope items
  {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  'kyazdani42/nvim-web-devicons',

  -- Other items
  'nvim-treesitter/playground',
}

local language_specific_plugins = {
  -- Clojure items
  { 'Olical/conjure', ft = {'clojure', 'lua'} },
  {
    'clojure-vim/vim-jack-in',
    ft = {'clojure'},
    requires = {
      'tpope/vim-dispatch',
      'radenling/vim-dispatch-neovim',
    },
  },
  { 'guns/vim-sexp', ft = {'clojure'} },
  { 'tpope/vim-sexp-mappings-for-regular-people', ft = {'clojure'} },
  -- For whatever reason, this plugin doesn't like to be lazy-loaded. Keep it
  -- with the other Clojure plugins anyway, though.
  'junegunn/rainbow_parentheses.vim',

  -- Other language-specific items
  'mxw/vim-jsx',
  'cespare/vim-toml',
}

local testing_plugins = {
  'jls83/galileo.nvim',
  'mfussenegger/nvim-dap',
  {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' },
  },
  "lukas-reineke/indent-blankline.nvim",
  {
    'mfussenegger/nvim-treehopper',
    requires = 'mfussenegger/nvim-treehopper',
  },
  {
    'SmiteshP/nvim-navbuddy',
    requires = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim',
      -- 'numToStr/Comment.nvim',
      'nvim-telescope/telescope.nvim',
    }
  },
  'tpope/vim-dadbod',
}

local forked_plugins = {
  {
    'jls83/nvim-ufo',
    branch = 'use_default_hl_group',
    requires = 'kevinhwang91/promise-async',
  },
  { 'jls83/vimwiki', branch = 'mixed_backlinks' },
  {
    'jls83/nvim-treesitter',
    branch = 'vimwiki_compat',
    build = ':TSUpdate',
  },
  { 'jls83/vim-oscyank', branch = 'fix_visual_range' },
  
}

return require('packer').startup(function()
  local plugin_arrays = {
    base_plugins,
    language_specific_plugins,
    testing_plugins,
    forked_plugins,
  }

  if vim.env.MACHINE_TYPE == 'glinux' then
    table.insert(plugin_arrays, require('google.plugins'))
  end

  for _, plugins in ipairs(plugin_arrays) do
    for _, v in ipairs(plugins) do
      use(v)
    end
  end
end)
