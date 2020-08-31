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
set signcolumn=yes

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
Plug 'gruvbox-community/gruvbox'

" Testing these
Plug 'Yggdroot/indentLine'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'mxw/vim-jsx'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-rhubarb'
Plug 'https://github.com/alok/notational-fzf-vim'

call plug#end()
" }}}1

" Color scheme settings {{{1
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
" }}}1

" Lightline settings {{{1
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
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
nnoremap <silent><leader>1 :NERDTreeToggle<CR>
nnoremap <silent><leader>sip :NERDTreeFind<CR>

" fzf-vim items
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
" No <CR> at the end to allow me to enter in items; add a space at the end to
" immediately enter text
nnoremap <leader>f :Rg 
vnoremap <leader>f y:Rg <C-r>"<CR>
nnoremap <leader>t :Lines 
vnoremap <leader>t y:Lines <C-r>"<CR>

" fugitive items
nnoremap <leader>gb :GBrowse<CR>
vnoremap <leader>gb :GBrowse<CR>
nnoremap <leader>gl :GBrowse!<CR>
vnoremap <leader>gl :GBrowse!<CR>

" `Git blame` no longer allows for convenient toggling when calling itself on
" an already-opened buffer. This function is copied from a Tim Pope suggestion
" on GitHub: https://github.com/tpope/vim-fugitive/issues/1474
function! s:BlameToggle() abort
    let found = 0
    for winnr in range(1, winnr('$'))
        if getbufvar(winbufnr(winnr), '&filetype') ==# 'fugitiveblame'
            exe winnr . 'close'
            let found = 1
        endif
    endfor
    if !found
        Git blame
    endif
endfunction
nnoremap <silent><leader>ga :call <SID>BlameToggle()<CR>

" CoC items {{{1
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB> pumvisible()
            \ ? "\<C-n>"
            \ : <SID>check_back_space()
                \ ? "\<TAB>"
                \ : coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" CoC Go-Tos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>u <Plug>(coc-references)
" }}}1

" Notational Velocity items {{{1
" TODO: Map over the `vimwiki_list` items here instead
let g:nv_search_paths = ['~/vimwiki']
" }}}1

" Honestly, weird stuff
nnoremap <leader>p :silent !open -a PyCharm %<CR>

function! CopySelectionNoLeadingIndent() range
    " Keep a reference to the current `modified` status, as our changes will
    " flip the flag to `true` despite no real changes occuring.
    let _modified = &modified

    " Get the smallest indentation in the selected block
    let min_indent = 0xFFFFFFFE
    for line_num in range(line("'<"), line("'>"))
        let local_indent = indent(line_num)
        if local_indent < min_indent
            let min_indent = local_indent
        endif
    endfor

    " TODO: Confirm we have an integer
    let indent_count = min_indent / &shiftwidth

    " Shift the whole block over using << (min_indent / shiftwidth) times
    for i in range(1, indent_count)
        silent exec "'<,'><"
    endfor

    " Copy the now-dedented range into the clipboard register
    let @+ = join(getline(line("'<"), line("'>")), "\n")

    " Shift the whole block over using >> (min_indent / shiftwidth) times;
    "   essentially back to normal
    for i in range(1, indent_count)
        silent exec "'<,'>>"
    endfor

    " Reset the `modified` flag to its original state
    let &modified = _modified
endfunction
vnoremap <silent><leader>x :call CopySelectionNoLeadingIndent()<CR>

" Copied from the vim-numbertoggle repo: https://github.com/jeffkreeftmeijer/vim-numbertoggle
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
