set encoding=UTF-8

filetype on
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')
" Plugin manager
Plug 'VundleVim/Vundle.vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Comment
Plug 'scrooloose/nerdcommenter'
" Theme
Plug 'joshdick/onedark.vim'
" Custor line
Plug 'yamatsum/nvim-cursorline'
" helpers
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
"
" Spellsitter
Plug 'lewis6991/spellsitter.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gt <Plug>(go-test)

" leader
let mapleader=";"
"
" nerdcommenter
let g:NERDSpaceDelims = 1

" Colorscheme
colorscheme onedark

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

" Rename current word
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Nvim-compe with delimitmate
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
