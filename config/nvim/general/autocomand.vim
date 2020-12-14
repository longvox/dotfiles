au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * %s/\s\+$//e

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd CursorHold * silent call CocActionAsync('highlight')
" au BufNewFile,BufRead * :Bdelete hidden
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
