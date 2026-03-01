let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
" let g:vimtex_fold_enabled = 1
let g:vimtex_quickfix_ignore_filters = [
      \ 'LaTeX Font Warning',
      \ 'Package fontspec Warning',
      \]
let g:tex_indent_items=1
function CR()
    if searchpair('\\begin{itemize}', '', '\\end{itemize}', '')
        return "\r\\item "
    endif
    if searchpair('\\begin{enumerate}', '', '\\end{enumerate}', '')
        return "\r\\item "
    endif
    return "\r"
endfunction
inoremap <expr><buffer> <CR> CR()
