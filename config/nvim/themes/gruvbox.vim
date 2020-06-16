if (has('termguicolors'))
  set termguicolors
endif

let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_transparent_bg=1
let g:gruvbox_theme_style = 'darker'
colorscheme gruvbox
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
highlight Normal guibg=none
highlight NonText guibg=none
