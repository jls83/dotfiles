if $MACHINE_TYPE != 'glinux'
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
endif
