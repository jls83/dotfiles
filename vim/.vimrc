" vim:foldmethod=marker:

if has('nvim')
    set termguicolors
endif

let mapleader = " "
inoremap jk <esc>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set relativenumber
set number
set showcmd
set cursorline

set list
set listchars=tab:▸\ ,eol:¬

syntax on
syntax enable
filetype plugin indent on

" Filetype-specific tab info
autocmd Filetype *.html,*.ps1,*.sql,*.yml setlocal tabstop=2 shiftwidth=2 softtabstop=2

let g:markdown_fenced_languages = ['python', 'javascript', 'yaml', 'sh', 'html', 'go']

" iTerm Blinkencursorzeit
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Plug.vim plugins {{{1
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'

" Testing these
Plug 'Yggdroot/indentLine'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'mxw/vim-jsx'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-rhubarb'

call plug#end()
" }}}1

" Color scheme settings {{{1
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
" }}}1

" Lightline settings {{{1
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \     'gitbranch': 'fugitive#head',
    \ },
    \ }
" Doesn't make sense to have Vim do modelines if lightline is handling it
set noshowmode
" }}}1

" VimWiki settings {{{1
"" Main Wiki {{{2
let main_wiki = {}
let main_wiki.path = '~/vimwiki'
let main_wiki.syntax = 'markdown'
let main_wiki.ext = '.md'
" }}}2

"" Manager Wiki {{{2
let manager_wiki = {}
let manager_wiki.path = '~/manager_stuff/wiki'
let manager_wiki.syntax = 'markdown'
let manager_wiki.ext = '.md'
" }}}2

let g:vimwiki_list = [main_wiki, manager_wiki]
let g:vimwiki_global_ext = 0 " don't use vimwiki syntax for all MD files
" }}}1

" NerdTree items
let NERDTreeShowHidden=1
nnoremap <leader>1 :NERDTreeToggle<CR>
nnoremap <leader>sip :NERDTreeFind<CR>

" fzf-vim items
" No <CR> at the end to allow me to enter in items; add a space at the end to
" immediately enter text
nnoremap <leader>f :Rg 
vnoremap <leader>f y:Rg <C-r>"<CR>
nnoremap <leader>t :Lines 
vnoremap <leader>t y:Lines <C-r>"<CR>

" fugitive items
nnoremap <leader>ga :Gblame<CR>
nnoremap <leader>gb :Gbrowse<CR>
vnoremap <leader>gb :Gbrowse<CR>

" CoC items {{{1
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" CoC Go-Tos
nmap <silent> <leader>b <Plug>(coc-definition)
nmap <silent> <leader>u <Plug>(coc-references)
" }}}1

" Honestly, weird stuff
nnoremap <leader>p :silent !open -a PyCharm %<CR>
