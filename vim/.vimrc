"Make vim more useful
set nocompatible

"Call pathogen
call pathogen#infect()

"Airline
let g:airline_theme = "solarized"
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "⮀"
let g:airline_left_alt_sep = "⮁"
let g:airline_right_sep = "⮂"
let g:airline_right_alt_sep = "⮃"
let g:airline_branch_prefix = "⭠"
let g:airline_readonly_symbol = "⭤"
let g:airline_linecolumn_prefix = "⭡"

"Optimize for fast terminal connections
set ttyfast

"Don't add empty newlines at the end of files
set binary
set noeol

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
compiler ruby

"Indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

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
