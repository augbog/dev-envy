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

" set line numbers
set nu

" set colorcolumn limit
set cc=90

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
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'

Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required

" turn off style checks from syntastic
let g:syntastic_quiet_messages = { "type": "style" }

" set vim autocompletion to check longest and list other options
set wildmenu
set wildmode=longest:list,full

" make it so NERDTree will show hidden dot files
" Toggle with Shift + i
let NERDTreeShowHidden=1

" Map esc to jk to exit out of modes fast
inoremap jk <esc>

" php lint syntax to Ctrl+B
map <C-B> :!php -l %<CR>

" Because YouCompleteMe uses tab, use Ctrl+J for vim-snippets
" https://github.com/Valloric/YouCompleteMe/issues/47
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" toggled line numbers
nmap <C-N><C-N> :set invnumber<CR>

" for Command T
let g:CommandTMaxFiles=1000000
let g:CommandTTraverseSCM ='pwd'
let g:CommandTFileScanner='find'

" set default to split right and below rather than left and up
set splitbelow
set splitright

" set swp and backup directories into vim folder
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
