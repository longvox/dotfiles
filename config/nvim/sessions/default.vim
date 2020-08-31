let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Downloads/NuxtMedium
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Downloads/NuxtMedium/layouts/default.vue
badd +1 ~/Downloads/NuxtMedium/components/Loading.vue
badd +35 ~/Downloads/NuxtMedium/pages/callback.vue
badd +78 ~/Downloads/NuxtMedium/nuxt.config.js
badd +0 ~/Downloads/NuxtMedium/pages/index.vue
argglobal
%argdel
edit ~/Downloads/NuxtMedium/pages/index.vue
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 84) / 169)
exe 'vert 2resize ' . ((&columns * 138 + 84) / 169)
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 61 - ((21 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
61
normal! 034|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 84) / 169)
exe 'vert 2resize ' . ((&columns * 138 + 84) / 169)
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
