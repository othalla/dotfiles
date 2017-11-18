" HOSTNAME
let hostname = substitute(system('hostname'), '\n', '', '')
let system = substitute(system('uname -s'), '\n', '', '')
let LTPC = "othallaptop"

if system == "FreeBSD"
  set mouse-=a
  set bg=dark
endif

if hostname == LTPC
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'scrooloose/syntastic'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'lifepillar/vim-solarized'
  Plugin 'flazz/vim-colorschemes'
  call vundle#end()

  " YCM
  let g:ycm_key_list_select_completion = ['<TAB>']

  " NERDCOMMENTER
  let mapleader=";"

  " VIM-COLORSCHEMES
  colorscheme molokai_dark
endif

syntax enable
filetype plugin indent on

set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
set t_Co=256

set nu
set ruler
set list
set cmdheight=1
set showmatch
set hlsearch
set nocompatible
set number
set wildmenu
set incsearch

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=100

set laststatus=2
set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
if version >= 700
  highlight statusLine cterm=bold ctermfg=7 ctermbg=1
  au InsertLeave * highlight StatusLine cterm=bold  ctermfg=7 ctermbg=1
  au InsertEnter * highlight StatusLine cterm=bold ctermfg=7 ctermbg=2
endif

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Python
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd Filetype python set tabstop=8
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set softtabstop=4
autocmd Filetype python set textwidth=79
autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd BufRead,BufNewFile *.c set ft=c
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd Filetype c set tabstop=8
autocmd Filetype c set shiftwidth=8
autocmd Filetype c set softtabstop=8
autocmd Filetype c set textwidth=100

"au Filetype c setl sw=2 sts=2
