au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd CursorHold * silent call CocActionAsync('highlight')
" au BufNewFile,BufRead * :Bdelete hidden
