"Make vim more useful
set nocompatible

"Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"Airline
let g:airline_theme = "solarized"
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"Set encoding
set encoding=utf-8

"Optimize for fast terminal connections
set ttyfast

"Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

"Display
syntax on
set background=dark
colorscheme solarized
set cursorline
set laststatus=2
set number
set relativenumber
set showmatch
set ruler

"Don't reset cursor to start of line when moving around
set nostartofline

"Word wrap
set nowrap
autocmd BufNewFile,BufRead *.md set wrap
autocmd BufNewFile,BufRead *.md set linebreak
autocmd BufNewFile,BufRead *.md set nolist
nmap j gj
nmap k gk

"Spell check
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

"FileType support
filetype plugin indent on

"Ruby compiler support
set shell=/bin/sh
compiler ruby

"Indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

"Trailing whitespace
autocmd FileType javascript,html,css,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

"Autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set wildmenu
set wildmode=longest,list

"Searching
set incsearch
set ignorecase
set smartcase
set gdefault
