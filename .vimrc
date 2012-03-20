"Make vim more useful
set nocompatible

"Enhance command-line completion
set wildmenu

"Optimize for fast terminal connections
set ttyfast

"Add the g flag to search/replace by default
set gdefault

"Don't add empty newlines at the end of files
set binary
set noeol

"Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

"Syntax highlighting
syntax on
colorscheme ir_black

"Line numbers
set number

"Highlight current line
set cursorline

"Don't reset cursor to start of line when moving around.
set nostartofline

"Always show status line
set laststatus=2

"Word wrap
set wrap
set linebreak
set nolist
set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 

"FileType support
set filetype=on
filetype plugin on
filetype indent on

"Indentation
autocmd FileType javascript,html,css,ruby set ai
autocmd FileType javascript,html,css,ruby set sw=2
autocmd FileType javascript,html,css,ruby set ts=2
autocmd FileType javascript,html,css,ruby set sts=2

"Enable autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"Maps autocomplete to tab
imap <Tab> <C-N>
imap <C-L> <Space>=><Space>

"Enable incremental search
autocmd FileType javascript,html,css set incsearch
