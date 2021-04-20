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

augroup FileType_Local_tabwidth
  autocmd!
  au FileType typescriptreact setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType scheme setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType typescript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType vim setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType sh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType zsh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType pegjs setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType javascript.jsx setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType pug setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType html setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType vue setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType eruby setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType scss setlocal tabstop=2 shiftwidth=2 expandtab iskeyword+=@-@
  au FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType cs setlocal tabstop=4 shiftwidth=4 expandtab
  au FileType html.erb setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType html.handlebars setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType apache setlocal commentstring=#\ %s
  au FileType gitconfig setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType php setlocal tabstop=2 shiftwidth=2 expandtab
augroup END
