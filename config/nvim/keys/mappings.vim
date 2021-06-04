" Leader key
let mapleader=" "
nnoremap <Space> <Nop>

" hack
" nnoremap <up>    :echoe "please use 'k' key"<CR>
" nnoremap <down>  :echoe "please use 'j' key"<CR>
" nnoremap <left>  :echoe "please use 'h' key"<CR>
" nnoremap <right> :echoe "please use 'l' key"<CR>

" hardcore
map <up>    :echoe "please use 'k' key"<CR>
map <down>  :echoe "please use 'j' key"<CR>
map <left>  :echoe "please use 'h' key"<CR>
map <right> :echoe "please use 'l' key"<CR>

" Navigation """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move left/right in insert mode
inoremap <M-h> <left>
inoremap <M-l> <right>
inoremap <M-k> <up>
inoremap <M-j> <down>

" switch window in vim
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

" map hjkl
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap H h
nnoremap L l
nnoremap l w
nnoremap h b
vnoremap H h
vnoremap L l
vnoremap l w
vnoremap h b

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-k>    :resize -1<CR>
nnoremap <silent> <M-j>    :resize +1<CR>
nnoremap <silent> <M-l>    :vertical resize -1<CR>
nnoremap <silent> <M-h>    :vertical resize +1<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
nnoremap <M-J> :m .+1<CR>==
nnoremap <M-K> :m .-2<CR>==
inoremap <M-J> <Esc>:m .+1<CR>==gi
inoremap <M-K> <Esc>:m .-2<CR>==gi
vnoremap <M-J> :m '>+1<CR>gv=gv
vnoremap <M-K> :m '<-2<CR>gv=gv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Navigation "

" Fold """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set as toggle foldcomment
map t @=(
      \ foldlevel('.')
      \   ? (
      \     (foldclosed(line('.')) < 0)
      \     ? 'zc'
      \     : 'zo'
      \   )
      \   : 'zf'
      \ )<CR>
nnoremap T zd<CR>
nnoremap zr zR
nnoremap za zA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Fold "

" Tab && Buffer && Indenting """""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between tabs
nnoremap <silent> <M-=> :tabnext<CR>
nnoremap <silent> <M--> :tabprevious<CR>

" Switch between buffers
nnoremap <silent> <M-0> :bnext<CR>
nnoremap <silent> <M-9> :bprevious<CR>

" Better indenting
nnoremap <S-Tab> <<
nnoremap <Tab> >>

vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

vnoremap < <gv
vnoremap > >gv
"""""""""""""""""""""""""""""""""""""""""""""""""""" Tab && Buffer && Indenting"

" Text """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uppercase current word
inoremap <M-u> <esc>viwUA

" Select all text
vmap a ggVG

" Quickly add empty lines
nnoremap <C-o> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" replace
nnoremap <C-R> :%s//gI<Left><Left><Left>
" move to beginning/end of line
nnoremap b ^
nnoremap e $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Find
nnoremap <C-f> /
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Text "

" Save && Close """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Saves the file (handling the permission-denied error)
if has("nvim")
  cnoremap w! execute
        \ 'silent! write !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null'
        \ <bar> edit!
else
  cnoremap w! w !sudo tee % > /dev/null
end
cnoremap we w

map q: :q
nmap <silent><Esc><Esc><Esc> :q!<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Save && Close "

" ESC """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Add simple hightlight removal
nnoremap <ESC><ESC> :nohlsearch<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" ESC "

" Trick text """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" simple surround
vmap " S"
vmap ' S'
vmap ` S`
vmap [ S[
vmap ( S(
vmap { S{
vmap } S}
vmap ] S]
vmap ) S)

" simple region expand
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap gd gdzz
nnoremap [[ [[zz
nnoremap ]] ]]zz
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Trick text "

" Other """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better nav for omniComplete
inoremap <expr> <M-j> '<C-n>'
inoremap <expr> <M-k> '<C-p>'

" Don't use recording now
nnoremap q <Nop>

" Debuger
nmap <silent>, <Plug>DumpDebugStringCexpr

" CarbonNowSh
vnoremap <F5> :CarbonNowSh<CR>

" Set time
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Other "
