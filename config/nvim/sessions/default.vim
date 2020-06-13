let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Work/BERT/BERT_KLTN
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +204 ~/Work/BERT/BERT_KLTN/Vnexpress/app_api.py
badd +408 ~/Work/BERT/BERT_KLTN/Vnexpress/crawlVnExp.py
badd +1 ~/Work/BERT/BERT_KLTN/Vnexpress/infer_predict.py
badd +1 ~/Work/BERT/BERT_KLTN/Vnexpress/post_crawl.py
badd +70 ~/Work/BERT/BERT_KLTN/Vnexpress/utils.py
badd +51 ~/Work/BERT/BERT_KLTN/Vnexpress/model_vnexpress.py
argglobal
%argdel
edit ~/Work/BERT/BERT_KLTN/Vnexpress/app_api.py
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
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
let s:l = 204 - ((8 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
204
normal! 021|
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
