set encoding=utf-8
set mouse-=a
set linespace=0

" Folding
setlocal foldmethod=indent
set foldlevelstart=20
set linespace=0

" Remember folding for old files
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" HOSTNAME
let hostname = substitute(system('hostname'), '\n', '', '')
let system = substitute(system('uname -s'), '\n', '', '')
let LTPC = "othallaptop"

if system == "FreeBSD"
  set bg=dark
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'tmhedberg/SimpylFold'
Plug 'VundleVim/Vundle.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'
Plug 'scrooloose/nerdcommenter'
Plug 'flazz/vim-colorschemes'
Plug 'rodjek/vim-puppet'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
call plug#end()

set hidden

" Deoplite
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='dark_minimal'
"
" ALE
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_fixers = [
\   'black',
\   'autopep8',
\   'remove_trailing_lines',
\   'isort',
\   'ale#fixers#generic_python#BreakUpLongLines',
\   'add_blank_lines_for_python_control_statements',
\   'trim_whitespace',
\   'yapf',
\]
let g:ale_linters = {
\   'python': ['flake8',
\              'mypy',
\              'prospector',
\              'pycodestyle',
\              'isort',
\              'pyflakes',
\              'pylint'],
\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" LanguageClient
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ 'puppet': ['tcp://127.0.0.1:10000'],
      \ 'go': ['go-langserver'],
      \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'

" SimpylFold

let g:SimpylFold_docstring_preview=1

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

" Line Break
:nnoremap <NL> i<CR><ESC>
