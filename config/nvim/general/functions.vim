au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au BufNewFile,BufRead *.* :Bdelete hidden

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" Rotate a window horizontally to the left
function! RotateLeft()
    let l:curbuf = bufnr('%')
    hide
    wincmd h
    split
    exe 'buf' l:curbuf
endfunc

" Rotate a window horizontally to the right
function! RotateRight()
    let l:curbuf = bufnr('%')
    hide
    wincmd l
    split
    exe 'buf' l:curbuf
endfunc

" Remove trailing whitespaces automatically before save
" augroup strip_ws
"   autocmd BufWritePre * call utils#stripTrailingWhitespaces()
" augroup END
