let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Work/My\ Project/NESTJS/Demo_Mongo_BOK
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +60 ~/Work/My\ Project/NESTJS/Demo_Mongo_BOK/rasa-chatbot/domain.yml
badd +102 ~/Work/My\ Project/NESTJS/Demo_Mongo_BOK/rasa-chatbot/data/stories.md
badd +18 ~/Work/My\ Project/NESTJS/Demo_Mongo_BOK/rasa-chatbot/data/nlu.md
badd +84 ~/Work/My\ Project/NESTJS/Demo_Mongo_BOK/rasa-chatbot/actions.py
badd +0 ~/Work/My\ Project/NESTJS/Demo_Mongo_BOK/rasa-chatbot/config.yml
argglobal
%argdel
edit ~/Work/My\ Project/NESTJS/Demo_Mongo_BOK/rasa-chatbot/config.yml
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 59) / 118)
exe 'vert 2resize ' . ((&columns * 87 + 59) / 118)
argglobal
enew
file \[coc-explorer]-1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 55 - ((50 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
55
normal! 03|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 59) / 118)
exe 'vert 2resize ' . ((&columns * 87 + 59) / 118)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
