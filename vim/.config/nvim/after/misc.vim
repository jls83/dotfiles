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
