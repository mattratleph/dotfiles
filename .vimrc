syntax on
colorscheme ir_black
set number

"Word wrap
set wrap
set linebreak
set nolist
set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 

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

"Enable incremental search
autocmd FileType javascript,html,css set incsearch
