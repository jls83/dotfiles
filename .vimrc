"set t_Co=256
"set term=xterm-256

execute pathogen#infect()

syntax on
syntax enable
filetype plugin indent on

set background=dark
colorscheme distinguished

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Filetype-specific tab info
autocmd Filetype sql setlocal ts=2 sw=2 sts=2
autocmd Filetype html setlocal ts=2 sw=2 sts=2
autocmd Filetype ps1 setlocal ts=2 sw=2 sts=2

set number
set showcmd
set cursorline
set ruler

set list
set listchars=tab:▸\ ,eol:¬

"CoffeeScript syntax stuff below
hi link coffeeSemicolonError NONE
hi link coffeeReservedError NONE
