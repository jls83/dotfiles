" Plug.vim plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, 'commit': '3f75a83' }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind-nvim'

" I am mildly inconvenienced without these
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'easymotion/vim-easymotion'
Plug 'jls83/vimwiki', {'branch': 'mixed_backlinks'}
" Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'itchyny/lightline.vim'

" Clojure stuff
Plug 'Olical/conjure', {'tag': 'v4.9.0'}
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'junegunn/rainbow_parentheses.vim'

" Other language-specific items
Plug 'mxw/vim-jsx'
Plug 'cespare/vim-toml'

" These two go together; meh
" Plug 'kalekundert/vim-coiled-snake'
" Plug 'Konfekt/FastFold'

" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'

" Testing these
Plug 'Yggdroot/indentLine'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-vinegar'
Plug 'ojroques/vim-oscyank'

" I have disabled these
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'alok/notational-fzf-vim'
" Plug 'prettier/vim-prettier'
"
" Plug 'file://'.expand('~/other_projects/nvim-panko'), {'branch': 'main'}

" Let's try it out, why not
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'

if $MACHINE_TYPE == "glinux"
  " Google-specific plugins here
  source $HOME/.config/nvim/google/my_google_plugins.vim
endif

call plug#end()
