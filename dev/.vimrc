set encoding=UTF-8

set mouse-=a
set linespace=0

" Folding
setlocal foldmethod=indent
set foldlevelstart=20

set linespace=0

call plug#begin('~/.vim/plugged')
" Plugin manager
Plug 'VundleVim/Vundle.vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Research
Plug 'ctrlpvim/ctrlp.vim'
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Golding
Plug 'tmhedberg/SimpylFold'
" Comment
Plug 'scrooloose/nerdcommenter'
" Theme
Plug 'flazz/vim-colorschemes'
" helpers
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'janko/vim-test'
" LSP
Plug 'neovim/nvim-lspconfig'
" Completion
Plug 'hrsh7th/nvim-compe'
" Statusbar
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" Lua config
" ==========
luafile ~/.config/nvim/config.lua

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'

" SimpylFold

let g:SimpylFold_docstring_preview=1

" NERDCOMMENTER
let mapleader=";"

" VIM-COLORSCHEMES
colorscheme molokai_dark

" VIMTEST
let test#python#runner = 'pytest'

syntax enable
filetype plugin indent on

set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
set t_Co=256

set nu
set ruler
set list
set showmatch
set hlsearch
set nocompatible
set wildmenu
set incsearch
set expandtab

" Default Indent & linesize
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=100

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

func! DeleteNewLineEndOfFile()
  set binary
  set noeol
endfunc

" GO
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Python
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80 expandtab autoindent colorcolumn=88 fileformat=unix
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Puppet
au BufNewFile,BufRead *.pp set filetype=puppet
autocmd BufWrite *.pp :call DeleteTrailingWS()
autocmd Filetype puppet setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80 expandtab autoindent colorcolumn=80 fileformat=unix

au BufNewFile,BufRead *.eyaml set filetype=yaml
autocmd BufWrite *.eyaml :call DeleteTrailingWS()
" c
autocmd FileType c setlocal shiftwidth=8 tabstop=8 softtabstop=8 textwidth=140
autocmd BufWrite *.c :call DeleteTrailingWS()

" Line Break
:nnoremap <NL> i<CR><ESC>
