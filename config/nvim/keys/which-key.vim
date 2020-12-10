" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['/'] = [ ':Commentary'              , 'comment'              ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'              , 'open init'            ]
let g:which_key_map['='] = [ '<C-W>='                   , 'balance windows'      ]
let g:which_key_map[','] = [ 'Startify'                 , 'start screen'         ]
let g:which_key_map['`'] = [ ':Bdelete hidden'          , 'close all buffer'     ]
let g:which_key_map['e'] = [ ':CocCommand explorer'     , 'explorer'             ]
let g:which_key_map['f'] = [ ':CocList outline'         , 'find outline'         ]
let g:which_key_map['h'] = [ '<C-W>s'                   , 'split below'          ]
let g:which_key_map['v'] = [ '<C-W>v'                   , 'split right'          ]
let g:which_key_map['R'] = [ ':source $MYVIMRC'         , 'reload source'        ]
" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'                       , 'colorizer'            ],
      \ 'e' : [':CocCommand explorer'                   , 'explorer'             ],
      \ 'n' : [':set nonumber!'                         , 'line-numbers'         ],
      \ 'r' : [':set norelativenumber!'                 , 'relative line nums'   ],
      \ 's' : [':let @/ = ""'                           , 'remove text highlight'],
      \ 't' : [':FloatermToggle'                        , 'terminal'             ],
      \ 'v' : [':Vista!!'                               , 'tag viewer'           ],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bd'                                     , 'delete-buffer'        ],
      \ 'f' : ['bfirst'                                 , 'first-buffer'         ],
      \ 'h' : ['Startify'                               , 'home-buffer'          ],
      \ 'l' : ['blast'                                  , 'last-buffer'          ],
      \ 'n' : ['bnext'                                  , 'next-buffer'          ],
      \ 'p' : ['bprevious'                              , 'previous-buffer'      ],
      \ '?' : ['Buffers'                                , 'fzf-buffer'           ],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ ';' : [':Commands'                              , 'commands'             ],
      \ 'a' : [':Ag'                                    , 'text Ag'              ],
      \ 'b' : [':Buffers'                               , 'open buffers'         ],
      \ 'c' : [':Commits'                               , 'commits'              ],
      \ 'e' : ['<Plug>(coc-codeaction-selected)'        , 'spell'                ],
      \ 'f' : [':Files'                                 , 'files'                ],
      \ 'g' : [':GFiles?'                               , 'git files'            ],
      \ 'l' : [':Lines'                                 , 'lines'                ],
      \ 'm' : [':Marks'                                 , 'marks'                ],
      \ 'M' : [':Maps'                                  , 'normal maps'          ],
      \ 'p' : [':Helptags'                              , 'help tags'            ],
      \ 'P' : [':Tags'                                  , 'project tags'         ],
      \ 's' : [':CocList snippets'                      , 'snippets'             ],
      \ 't' : [':Rg'                                    , 'text Rg'              ],
      \ 'w' : [':Windows'                               , 'search windows'       ],
      \ 'y' : [':Filetypes'                             , 'file types'           ],
      \ 'z' : [':FZF'                                   , 'FZF'                  ],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                             , 'add all'              ],
      \ 'A' : [':Git add %'                             , 'add current'          ],
      \ 'b' : [':Git blame'                             , 'blame'                ],
      \ 'B' : [':GBrowse'                               , 'browse'               ],
      \ 'c' : [':Git commit'                            , 'commit'               ],
      \ 'd' : [':Git diff'                              , 'diff'                 ],
      \ 'D' : [':Gdiffsplit'                            , 'diff split'           ],
      \ 'g' : [':GGrep'                                 , 'git grep'             ],
      \ 'G' : [':Gstatus'                               , 'status'               ],
      \ 'h' : [':GitGutterLineHighlightsToggle'         , 'highlight hunks'      ],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'           , 'preview hunk'         ],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'              , 'next hunk'            ],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'              , 'prev hunk'            ],
      \ 'l' : [':Git log'                               , 'log'                  ],
      \ 'p' : [':Git push origin HEAD'                  , 'push'                 ],
      \ 'P' : [':Git pull'                              , 'pull'                 ],
      \ 'T' : [':GitGutterSignsToggle'                  , 'toggle signs'         ],
      \ 'v' : [':GV'                                    , 'view commits'         ],
      \ 'V' : [':GV!'                                   , 'view buffer commits'  ],
      \ }
" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                             , 'config'               ],
      \ ';' : ['<Plug>(coc-refactor)'                   , 'refactor'             ],
      \ 'a' : ['<Plug>(coc-codeaction)'                 , 'line action'          ],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'        , 'selected action'      ],
      \ 'b' : [':CocNext'                               , 'next action'          ],
      \ 'B' : [':CocPrev'                               , 'prev action'          ],
      \ 'f' : ['<Plug>(coc-format)'                     , 'format'               ],
      \ 'h' : ['<Plug>(coc-float-hide)'                 , 'hide'                 ],
      \ 'i' : [':CocList diagnostics'                   , 'diagnostics'          ],
      \ 'j' : ['<Plug>(coc-float-jump)'                 , 'float jump'           ],
      \ 'l' : ['<Plug>(coc-codelens-action)'            , 'code lens'            ],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'            , 'next diagnostic'      ],
      \ 'N' : ['<Plug>(coc-diagnostic-prev)'            , 'prev diagnostic'      ],
      \ 'e' : ['<Plug>(coc-diagnostic-next-error)'      , 'next error'           ],
      \ 'E' : ['<Plug>(coc-diagnostic-prev-error)'      , 'prev error'           ],
      \ 'o' : ['<Plug>(coc-openlink)'                   , 'open link'            ],
      \ 'q' : ['<Plug>(coc-fix-current)'                , 'quick fix'            ],
      \ 'r' : ['<Plug>(coc-rename)'                     , 'rename'               ],
      \ 'R' : ['<Plug>(coc-references)'                 , 'references'           ],
      \ 's' : [':CocList -I symbols'                    , 'symbols'              ],
      \ 'S' : [':CocList snippets'                      , 'snippets'             ],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal/tab' ,
      \ ';' : [':FloatermNew --wintype=float --height=6', 'terminal'             ],
      \ 'f' : [':FloatermNew fzf'                       , 'fzf'                  ],
      \ 'g' : [':FloatermNew lazygit'                   , 'git'                  ],
      \ 'd' : [':FloatermNew lazydocker'                , 'docker'               ],
      \ 'p' : [':FloatermNew python'                    , 'python'               ],
      \ 't' : [':FloatermToggle'                        , 'toggle'               ],
      \ 'h' : [':FloatermNew htop'                      , 'htop'                 ],
      \ 'n' : [':tabnew'                                , 'tab new'              ],
      \ 'c' : [':tabclose'                              , 'tab close'            ]
      \ }

" t in t for tig
let g:which_key_map.t.i = {
      \ 'name' : '+tig',
      \ 'c' : [':TigOpenCurrentFile'                    , 'current file'         ],
      \ 'p' : [':TigOpenProjectRootDir'                 , 'project root path'    ],
      \ 'g' : [':TigGrep'                               , 'tig grep'             ],
      \ 'r' : [':TigGrepResume'                         , 'resume last grep'     ],
      \ 's' : [':TigGrep<Space><C-R>"'                  , 'grep with select word'],
      \ 'u' : [':<C-u>:TigGrep<Space><C-R><C-W>'        , 'grep word in cursor'  ],
      \ 'b' : [':TigBlame'                              , 'tig blame'            ],
      \}

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
