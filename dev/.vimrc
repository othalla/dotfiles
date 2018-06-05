set encoding=utf-8
set mouse-=a


" HOSTNAME
let hostname = substitute(system('hostname'), '\n', '', '')
let system = substitute(system('uname -s'), '\n', '', '')
let LTPC = "othallaptop"

if system == "FreeBSD"
  set bg=dark
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'ryanolsonx/vim-lsp-python'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete-file.vim'
Plugin 'prabirshrestha/asyncomplete-buffer.vim'
Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'rodjek/vim-puppet'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'godlygeek/tabular'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
call vundle#end()

" LSP
" PYTHON
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" Asyncomplete 
" Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" File completion
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
" Buffer completion
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))



" NERDTREE
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'


" NERDCOMMENTER
let mapleader=";"

" VIM-COLORSCHEMES
if !empty(glob("~/.vim/bundle/vim-colorschemes/"))
   colorscheme molokai_dark
endif

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

" statusbat
set cmdheight=1
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

func! DeleteNewLineEndOfFile()
  set binary
  set noeol
endfunc

" Python
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80 expandtab autoindent colorcolumn=80 fileformat=unix
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Puppet
au BufNewFile,BufRead *.pp set filetype=puppet
autocmd BufWrite *.pp :call DeleteTrailingWS()
autocmd Filetype puppet setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80 expandtab autoindent colorcolumn=80 fileformat=unix

" c
autocmd FileType c setlocal shiftwidth=8 tabstop=8 softtabstop=8 textwidth=140
autocmd BufWrite *.c :call DeleteTrailingWS()
