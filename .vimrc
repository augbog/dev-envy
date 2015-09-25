set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" show character count in visual mode
set showcmd

" set syntax highlighting
syntax on

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'moll/vim-node'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'wincent/command-t'
Plugin 'mkitt/tabline.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required

" Map esc to jk to exit out of modes fast
inoremap jk <esc>

" for Command T
let g:CommandTMaxFiles=1000000
let g:CommandTTraverseSCM ='pwd'
let g:CommandTFileScanner='find'

" set default to split right and below rather than left and up
set splitbelow
set splitright

" set swp and backup directories into vim folder
" make sure to mkdir them in your .vim folder
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
