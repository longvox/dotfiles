" vim tig mapping keys
let g:tig_explorer_keymap_edit    = '<C-o>'
let g:tig_explorer_keymap_tabedit = '<C-t>'
let g:tig_explorer_keymap_split   = '<C-s>'
let g:tig_explorer_keymap_vsplit  = '<C-v>'

" map hjkl
nnoremap L l
nnoremap H h
nnoremap l w
nnoremap h b

" scroll 1 page up/down
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

" Switch between tabs
map <M-=> :tabnext<CR>
map <M--> :tabprevious<CR>

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

" Autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Quickly put double quotes around a word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Select all text
nnoremap vA ggVG

" Delete current line n insert mode
inoremap <c-d> <esc>ddi

" Uppercase current word
inoremap <c-u> <esc>viwUA

" move to beginning/end of line
nnoremap B ^
nnoremap E $

"Delete to the end of line
nnoremap D d$

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap gd gdzz

" Home & End should be placed next to each other
nnoremap - $

" Don't use recording now
nnoremap Q @@
vnoremap Q :norm @@<cr>

" Add simple hightlight removal
nnoremap <ESC><ESC> :nohlsearch<cr>

" Saves the file (handling the permission-denied error)
cnoremap w!! w !sudo tee % >/dev/null

" Save the file with readonly
cnoremap w w!

" map jk
nnoremap j gj
nnoremap k gk

" Quickly add empty lines
nnoremap <C-o>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

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

" replace
nnoremap <M-C-r> :%s//gI<Left><Left><Left>

" hack
nnoremap <up>    :echoe "please use 'k' key"<CR>
nnoremap <down>  :echoe "please use 'j' key"<CR>
nnoremap <left>  :echoe "please use 'h' key"<CR>
nnoremap <right> :echoe "please use 'l' key"<CR>

" g Leader key
let mapleader=" "

" let localleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" paste and auto jump end line
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


if exists('g:vscode')
  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
else
  " Better nav for omniComplete
  inoremap <expr> <M-j> '<C-n>'
  inoremap <expr> <M-k> '<C-p>'

  " I hate escape more than anything else
  inoremap jk <Esc>
  inoremap kj <Esc>
  inoremap jj <Esc>

  " Operation mapping
  onoremap in( :<c-u>normal! f(vi(<cr>
  onoremap il( :<c-u>normal! F(vi(<cr>
  onoremap p i(

  " AutoCompletion
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Easy CAPS
  inoremap <c-u> <ESC>viwUi
  nnoremap <c-u> viwU<Esc>

  " TAB in general mode will move to text buffer
  nnoremap <silent> <TAB> :bnext<CR>
  " SHIFT-TAB will go back
  nnoremap <silent> <S-TAB> :bprevious<CR>

  " Move selected line / block of text in visual mode
  " shift + k to move up
  " shift + j to move down
  nnoremap <M-J> :m .+1<CR>==
  nnoremap <M-K> :m .-2<CR>==
  inoremap <M-J> <Esc>:m .+1<CR>==gi
  inoremap <M-K> <Esc>:m .-2<CR>==gi
  vnoremap <M-J> :m '>+1<CR>gv=gv
  vnoremap <M-K> :m '<-2<CR>gv=gv

  " Alternate way to save
  nnoremap <silent> <C-s> :w<CR>
  " Alternate way to quit
  nnoremap <silent> <C-Q> :wq!<CR>
  " Use control-c instead of escape
  nnoremap <silent> <C-c> <Esc>
  " <TAB>: completion.
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


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

  " Markdown Settings
  vnoremap <D-j> gj
  vnoremap <D-k> gk
  vnoremap <D-4> g$
  vnoremap <D-6> g^
  vnoremap <D-0> g^
  nnoremap <D-j> gj
  nnoremap <D-k> gk
  nnoremap <D-4> g$
  nnoremap <D-6> g^
  nnoremap <D-0> g^
  " }}}

  " Use alt + hjkl to resize windows
  nnoremap <silent> <M-k>    :resize -1<CR>
  nnoremap <silent> <M-j>    :resize +1<CR>
  nnoremap <silent> <M-l>    :vertical resize -1<CR>
  nnoremap <silent> <M-h>    :vertical resize +1<CR>

  " save file sudo
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

  " set time
  nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
  imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

  " CarbonNowSh
  vnoremap <F5> :CarbonNowSh<CR>

  " Start tracking Vim session
  nnoremap <leader>o :Obsession<CR>
endif
