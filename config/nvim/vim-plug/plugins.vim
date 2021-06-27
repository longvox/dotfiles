" auto-install vim-plug
if empty(glob('~/.dotfiles/config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'editorconfig/editorconfig-vim'
  " Convert binary, hex, etc..
  Plug 'glts/vim-radical'
  " Files Plug 'tpope/vim-eunuch'
  " Repeat stuff
  Plug 'tpope/vim-repeat'
  " Surround
  Plug 'tpope/vim-surround'
  " Better Comments
  Plug 'tpope/vim-commentary'
  Plug 'preservim/nerdcommenter'
  " Have the file system follow you around
  Plug 'airblade/vim-rooter'
  " auto set indent settings
  Plug 'tpope/vim-sleuth'
  " wakatime
  Plug 'wakatime/vim-wakatime'
  " Easy motion for VSCode
  Plug 'asvetliakov/vim-easymotion'
  " react
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  " Text Navigation
  Plug 'justinmk/vim-sneak'
  " Plug 'easymotion/vim-easymotion'
  " Add some color
  Plug 'junegunn/rainbow_parentheses.vim'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Cool Icons
  Plug 'ryanoasis/vim-devicons'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Closetags
  Plug 'alvan/vim-closetag'
  " Themes
  Plug 'joshdick/onedark.vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'jacoborus/tender.vim'
  Plug 'ntk148v/vim-horizon'
  Plug 'morhetz/gruvbox'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Status Line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " bclose
  Plug 'rbgrouleff/bclose.vim'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Git
  Plug 'mhinz/vim-signify'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  " Terminal
  Plug 'voldikss/vim-floaterm'
  " Start Screen
  Plug 'mhinz/vim-startify'
  " Vista
  Plug 'liuchengxu/vista.vim'
  " See what keys do like in emacs
  Plug 'liuchengxu/vim-which-key'
  " Making stuff
  Plug 'neomake/neomake'
  " Snippets
  Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim'
  " Better Comments
  Plug 'jbgutierrez/vim-better-comments'
  " Vim tig
  Plug 'iberianpig/tig-explorer.vim'
  " mutiple  cursor
  Plug 'terryma/vim-multiple-cursors'
  " vim tsx
  Plug 'ianks/vim-tsx'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'ap/vim-css-color'
  " vim php
  Plug 'shawncplus/phpcomplete.vim'
  Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
  Plug 'jwalton512/vim-blade'
  Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
  " show author git commit in line
  Plug 'apzelos/blamer.nvim'
  " check tslint
  Plug 'neoclide/coc-tslint'
  " mutile cursor
  Plug 'terryma/vim-multiple-cursors'
  " tmux navigator
  Plug 'christoomey/vim-tmux-navigator'
  " close buffer
  Plug 'Asheq/close-buffers.vim'
  " opening selected content
  Plug 'kristijanhusak/vim-carbon-now-sh'
  " Vim plugin that provides additional text objects
  Plug 'wellle/targets.vim'
  " Make the yanked region apparent!
  Plug 'machakann/vim-highlightedyank'
  " A vim plugin that simplifies the transition between multiline and single-line code
  Plug 'AndrewRadev/splitjoin.vim'
  " Better whitespace highlighting for Vim
  Plug 'ntpeters/vim-better-whitespace'
  " highlight logstash
  Plug 'robbles/logstash.vim'
  " vim go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " vim debug string
  Plug 'https://github.com/longvox/vim-debugstring'
  " vim-expand-region
  Plug 'terryma/vim-expand-region'
  " vim-wiki
  Plug 'vimwiki/vimwiki'
  " Place deoplete first, then autocomplete-flow
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'wokalski/autocomplete-flow'
  " You will also need the following for function argument completion:
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  "
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  " Include Phpactor
  Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
  " Dart LSC VIM
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
