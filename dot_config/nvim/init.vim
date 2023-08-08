set encoding=UTF-8
set mouse=

filetype on
filetype plugin on
filetype indent on

set termguicolors

call plug#begin('~/.vim/plugged')
" Plugin manager
" Plug 'VundleVim/Vundle.vim'
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/spellsitter.nvim'
" Golang
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
" Comment
Plug 'scrooloose/nerdcommenter'
" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Icons for LSP
Plug 'onsails/lspkind-nvim'
" Custor line
Plug 'yamatsum/nvim-cursorline'
" helpers
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" LSP
Plug 'neovim/nvim-lspconfig'
" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"compinit Statusbar
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" ultest
Plug 'voldikss/vim-floaterm'
" Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-go'

Plug 'romgrk/barbar.nvim'
" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
" ScrollBar
Plug 'petertriho/nvim-scrollbar'
Plug 'towolf/vim-helm'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

" Lua config
" ==========
luafile ~/.config/nvim/config.lua

set completeopt=menu,menuone,noselect

" leader
let mapleader=";"
"
" nerdcommenter
let g:NERDSpaceDelims = 1

let g:tokyonight_style = "night"
colorscheme tokyonight

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

" Go
autocmd BufWrite *.go :call DeleteTrailingWS()
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=140 expandtab autoindent colorcolumn=140 fileformat=unix

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

set foldmethod=expr
set foldminlines=0
set foldnestmax=3
set foldlevelstart=20
set foldexpr=nvim_treesitter#foldexpr()

" Line Break
:nnoremap <NL> i<CR><ESC>

" Rename current word
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

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

" DAP
nnoremap <leader>db <cmd>lua require'dap'.toggle_breakpoint()<cr>
nnoremap <leader>dc <cmd>lua require'dap'.continue()<cr>
nnoremap <leader>ds <cmd>lua require("dapui").setup()
nnoremap <leader>dc <cmd>lua require("dapui").close()

" Ultest mappings
nmap tf <cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>
nmap tn <cmd>lua require("neotest").run.run()<cr>
nmap ts <cmd>lua require("neotest").summary.toggle()<cr>
nmap to <cmd>lua require("neotest").output.open({ enter = false })<cr>

" Dap mapping for tests
nmap td <cmd>lua require('dap-go').debug_test()<cr>
nmap ti <cmd>lua require("dapui").float_element()<cr>

nnoremap <silent>[t <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
nnoremap <silent>]t <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>
