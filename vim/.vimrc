set nocompatible
filetype plugin on

"turn on syntax highlights"
syntax on

"show line number"
set number

"set utf-8 encoding"
set encoding=utf8

"set mouse abilities"
set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benmills/vimux'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'

call plug#end()
