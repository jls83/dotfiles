" vim:foldmethod=marker:

if has('nvim')
    set termguicolors
endif

let mapleader = " "
inoremap jk <esc>
nnoremap Y y$

nnoremap <leader>y :%y*<CR>
vnoremap <leader>y "*y

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

let g:markdown_fenced_languages = ['python', 'javascript', 'yaml', 'sh', 'html', 'go', 'clojure', 'typescript']

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" This is terrifying to me.
let g:python3_host_prog = '/Users/jls83/.virtualenvs/py3nvim/bin/python'
let g:node_host_prog = '/Users/jls83/.nvm/versions/node/v14.17.0/bin/neovim-node-host'

" This is annoying to me
let g:markdown_syntax_conceal = 0
let g:vim_json_conceal = 0

" " iTerm Blinkencursorzeit
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
" Plug.vim plugins {{{1
call plug#begin()
" I am dead without these
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'hrsh7th/nvim-compe'

" I am mildly inconvenienced without these
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
" Plug 'jls83/vimwiki', {'branch': 'mixed_backlinks'}
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
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
Plug 'preservim/tagbar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

" I have disabled these
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'alok/notational-fzf-vim'
" Plug 'prettier/vim-prettier'
"
Plug 'file://'.expand('~/other_projects/nvim-panko'), {'branch': 'main'}
Plug 'bryall/contextprint.nvim', {'branch': 'main'}

call plug#end()
" }}}1

" Color scheme settings {{{1
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
hi Normal guibg=NONE ctermbg=NONE
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
" Have to do this as a hack to allow for the double bracket link syntax
autocmd VimEnter * let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']
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

" NerdTree items {{{1
let NERDTreeShowHidden=1
nnoremap <silent><leader>1 :NERDTreeToggle<CR>
nnoremap <silent><leader>sip :NERDTreeFind<CR>
" }}}1

" fzf-vim items {{{1
let g:fzf_layout = { 'down': '40%' }

nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
" No <CR> at the end to allow me to enter in items; add a space at the end to
" immediately enter text
nnoremap <leader>f :Rg 
vnoremap <leader>f y:Rg <C-r>"<CR>
nnoremap <leader>t :Lines 
vnoremap <leader>t y:Lines <C-r>"<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}1

" fugitive items {{{1
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
        " If the line is empty don't check the indent level, as it should be
        " zero
        let local_length = strwidth(getline(line_num))
        if (local_indent < min_indent) && (local_length > 0)
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

" Rainbow Parens Stuff
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
augroup rainbow_lisp
    autocmd!
    autocmd Filetype clojure RainbowParentheses
augroup END

" UltiSnips stuff
" Add a weird override to not blow away regular tab completion
let g:UltiSnipsExpandTrigger="<c-s-tab>"

" Some other stuff I'm working on

au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
\  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
\  1,
\  0
\)

" Native LSP stuff here
let g:diagnostic_enable_virtual_text = 1

set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua require('lsp-config')
lua require('compe-config')

" I honestly don't know.
function! GetSpaces(foldLevel)
    if &expandtab == 1
        " Indenting with spaces
        let str = repeat(" ", a:foldLevel / (&shiftwidth + 1) - 1)
        return str
    elseif &expandtab == 0
        " Indenting with tabs
        return repeat(" ", indent(v:foldstart) - (indent(v:foldstart) / &shiftwidth))
    endif
endfunction

function! MyFoldText()
    let startLineText = getline(v:foldstart)
    let endLineText = trim(getline(v:foldend))
    let indentation = GetSpaces(foldlevel("."))
    let spaces = repeat(" ", 200)

    let str = indentation . startLineText . "..." . endLineText . spaces

    return str
endfunction

" Custom display for text when folding
set foldtext=MyFoldText()

" TODO: This can cause the folds to freak out or some reason?
nnoremap zf zcVzCzo
