" vim:foldmethod=marker:

if has('nvim')
    set termguicolors
endif

let mapleader = " "
inoremap jk <esc>
nnoremap Y y$

nnoremap <leader>y :%y*<CR>
vnoremap <leader>y "*y
nnoremap <leader>p "*p

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

set matchpairs+=<:>

set mouse=

syntax on
syntax enable
filetype plugin indent on

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

" Custom display for text when folding
function! MyFoldText()
    let lineCount = (v:foldend - v:foldstart) + 1
    return getline(v:foldstart) . '...' . trim(getline(v:foldend)) . '    (' . lineCount . ')'
endfunction

set foldtext=MyFoldText()
set fillchars=fold:\ 

" This is terrifying to me.
let g:python3_host_prog = '$HOME/.virtualenvs/py3nvim/bin/python'
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" This is annoying to me
let g:markdown_syntax_conceal = 0
let g:vim_json_conceal = 0

" Notational Velocity items {{{1
" TODO: Map over the `vimwiki_list` items here instead
let g:nv_search_paths = ['~/vimwiki']
" }}}1

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

" Some other stuff I'm working on

set completeopt=menuone,noselect
set shortmess+=c

lua require('plugins')

" Some machine-specific items here
if $MACHINE_TYPE == "glinux"
  source $HOME/.config/nvim/google/my_google.vim
  " lua require('google.telescope-codesearch-config')
  " lua require('google.lsp-config')
endif

" TODO: This can cause the folds to freak out or some reason?
nnoremap zf zcVzCzo

" indentLine Stuff
let g:indentLine_setColors = 1
let g:indentLine_enabled = 1

" TODO: Should this go somewhere else?
" TODO: Expand for C files as well?
function! ToggleHeaderAndImplFile() abort
    let file_extension = expand("%:e")
    if file_extension == "cc"
        edit %<.h
    elseif file_extension == "h"
        edit %<.cc
    else
        echom "File ext not supported"
    endif
endfunction
nnoremap <silent><leader>gh :call ToggleHeaderAndImplFile()<cr>


" TODO: Doing this in `after` doesn't work properly.
autocmd VimEnter * let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']

let main_wiki = {}
let main_wiki.path = '~/vimwiki'
let main_wiki.syntax = 'markdown'
let main_wiki.ext = '.md'

let g:vimwiki_list = [main_wiki]
let g:vimwiki_global_ext = 0 " don't use vimwiki syntax for all MD files

" Add a leading '../' to links to allow for linking to main wiki articles from
" the diary.
nnoremap <leader>wl 0f[wi../<ESC>
