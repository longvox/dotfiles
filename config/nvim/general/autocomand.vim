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
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

au BufNewFile,BufRead *.vue set ft=html
au BufNewFile,BufRead *.cubec,*.ax,*.handlebar,*.mustache,*.tpl set ft=mustache
au BufNewFile,BufRead *.vm,*.stm set ft=velocity
au BufRead *.ts set ft=typescript
au BufRead *.rs set ft=rust

augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
