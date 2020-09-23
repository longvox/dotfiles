let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Work/Office/backend-ms-wisere
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 src/services/branch-service/controllers/service-category-controller.ts
badd +128 src/services/branch-service/controllers/location-detail-controller.ts
badd +39 src/services/branch-service/routes/location-routes.ts
badd +977 src/services/branch-service/controllers/location-controller.ts
badd +50 src/repositories/postgres/models/index.ts
badd +793 src/services/branch-service/controllers/service-controller.ts
badd +213 src/services/branch-service/controllers/resource-controller.ts
badd +934 src/services/staff-service/controllers/staff-controller.ts
badd +126 src/services/staff-service/configs/validate-schemas/staff.ts
badd +2 src/services/staff-service/configs/consts/index.ts
badd +26 .env
badd +1 src/utils/hash-object/index.ts
badd +3 src/utils/hash-object/obj.ts
badd +9 src/utils/time-slots/time-slots.ts
badd +1 src/repositories/postgres/models/resource.ts
badd +14 term://~/Work/Office/backend-ms-wisere//117267:git\ diff
badd +28 src/services/staff-service/routes/staff-route.ts
argglobal
%argdel
edit src/services/staff-service/controllers/staff-controller.ts
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
let s:l = 935 - ((45 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
935
normal! 04|
lcd ~/Work/Office/backend-ms-wisere
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
