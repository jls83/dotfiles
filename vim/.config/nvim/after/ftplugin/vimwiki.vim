" Have to do this as a hack to allow for the double bracket link syntax
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
