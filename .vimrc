"Make vim more useful
set nocompatible

"Call pathogen
call pathogen#infect()

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

"Don't reset cursor to start of line when moving around.
set nostartofline

"Word wrap
set wrap
set linebreak
set nolist
set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 

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
autocmd FileType javascript,html,css set incsearch
set gdefault
