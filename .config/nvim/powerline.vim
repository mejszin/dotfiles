set laststatus=2
set noshowmode

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
\ 'colorscheme': 'tender',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }