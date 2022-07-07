base_plugins = {
    'wbthomason/packer.nvim',

    -- Appearance plugins
    'gruvbox-community/gruvbox',
    'itchyny/lightline.vim',

    -- Editing plugins
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-repeat',
    'tpope/vim-vinegar',

    -- Vimwiki items
    { 'jls83/vimwiki', branch = 'mixed_backlinks' },
    -- { 'vimwiki/vimwiki', branch = 'dev' },

    -- Git plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- fzf plugins
    { 'junegunn/fzf', run = function() vim.fn["fzf#install"]() end, commit = '3f75a83' },
    'junegunn/fzf.vim',

    -- LSP, Completion, and Snippets plugins
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'onsails/lspkind-nvim',
    'honza/vim-snippets',
    'SirVer/ultisnips',

    -- Telescope items
    {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    'kyazdani42/nvim-web-devicons',

    -- Other items
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    'ojroques/vim-oscyank',
    'easymotion/vim-easymotion',

}

language_specific_plugins = {
    -- Clojure items
    {
        'Olical/conjure',
        tag = 'v4.9.0',
        ft = {'clojure'}
    },
    {
        'clojure-vim/vim-jack-in',
        ft = {'clojure'},
        requires = { 'tpope/vim-dispatch', ft = {'clojure'} },
        requires = { 'radenling/vim-dispatch-neovim', ft = {'clojure'} }
    },
    {
        'guns/vim-sexp',
        ft = {'clojure'}
    },
    {
        'tpope/vim-sexp-mappings-for-regular-people',
        ft = {'clojure'}
    },
    {
        'junegunn/rainbow_parentheses.vim',
        ft = {'clojure'}
    },

    -- Other language-specific items
    'mxw/vim-jsx',
    'cespare/vim-toml',
}

testing_plugins = {
    -- { 'nvim-treesitter/nvim-treesitter-context' },
}

return require('packer').startup(function()
    plugin_arrays = {
        base_plugins,
        language_specific_plugins,
        testing_plugins,
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
