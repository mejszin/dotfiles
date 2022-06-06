" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Fuzzy file search
    Plug 'ctrlpvim/ctrlp.vim'
    " Lightline
    Plug 'itchyny/lightline.vim'
    " Plastic theme
    Plug 'flrnprz/plastic.vim'
    " Embark theme
    Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
    " Gruvbox theme
    Plug 'morhetz/gruvbox'
    " Tender theme
    Plug 'jacoborus/tender.vim'

call plug#end()