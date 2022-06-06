" Enable syntax highlighting
syntax on

" Set colorscheme
set background=dark
colorscheme tender

" Encoding UTF-8
set encoding=UTF-8

" Have the mouse enabled all the time
set mouse=a

" Highlight matching brackets
set showmatch

" Highlight cursor line
set cursorline

" Searching is case insensitive when all lowercase
set ignorecase smartcase

" Don't beep for errors
set visualbell

" Show line number
set number

" Show current line info (current/total)
set ruler rulerformat=%=%l/%L

" JSON is JS
au BufNewFile,BufRead *.json set ai filetype=javascript