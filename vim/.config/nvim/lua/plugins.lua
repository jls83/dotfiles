return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- I am dead without these
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use {
        'junegunn/fzf',
        run = function() vim.fn["fzf#install"]() end,
        commit = '3f75a83'
    }
    use 'junegunn/fzf.vim'
    use 'gruvbox-community/gruvbox'
    use 'tpope/vim-vinegar'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'onsails/lspkind-nvim'

    -- I am mildly inconvenienced without these
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'easymotion/vim-easymotion'
    use { 'jls83/vimwiki', branch = 'mixed_backlinks' }
    -- use { 'vimwiki/vimwiki', branch = 'dev' }
    use 'itchyny/lightline.vim'

    -- Clojure stuff
    use {
        'Olical/conjure',
        tag = 'v4.9.0',
        ft = {'clojure'}
    }
    use {
        'clojure-vim/vim-jack-in',
        ft = {'clojure'},
        requires = { 'tpope/vim-dispatch', ft = {'clojure'} },
        requires = { 'radenling/vim-dispatch-neovim', ft = {'clojure'} }
    }
    use {
        'guns/vim-sexp',
        ft = {'clojure'}
    }
    use {
        'tpope/vim-sexp-mappings-for-regular-people',
        ft = {'clojure'}
    }
    use {
        'junegunn/rainbow_parentheses.vim',
        ft = {'clojure'}
    }

    -- Other language-specific items
    use 'mxw/vim-jsx'
    use 'cespare/vim-toml'

    -- Testing these
    use 'Yggdroot/indentLine'
    use 'honza/vim-snippets'
    use 'SirVer/ultisnips'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'ojroques/vim-oscyank'

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'kyazdani42/nvim-web-devicons'
end)
