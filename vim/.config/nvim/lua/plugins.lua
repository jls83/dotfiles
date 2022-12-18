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
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind-nvim',

    -- Telescope items
    {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    'kyazdani42/nvim-web-devicons',

    -- Other items
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        -- Weird issues with the TSError junk; remove after upgrading neovim to v0.8
        commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0',
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    { 'jls83/vim-oscyank', branch = 'fix_visual_range' },
    'easymotion/vim-easymotion',

}

language_specific_plugins = {
    -- Clojure items
    { 'Olical/conjure', ft = {'clojure'} },
    {
        'clojure-vim/vim-jack-in',
        ft = {'clojure'},
        requires = { 'tpope/vim-dispatch', ft = {'clojure'} },
        requires = { 'radenling/vim-dispatch-neovim', ft = {'clojure'} }
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

testing_plugins = {
    -- { 'nvim-treesitter/nvim-treesitter-context' },
    'hrsh7th/cmp-nvim-lua',
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
