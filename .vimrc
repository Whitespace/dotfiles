set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'The-NERD-tree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Conque-Shell'
Plugin 'flazz/vim-colorschemes'
Plugin 'klen/python-mode'
Plugin 'kien/ctrlp.vim'
Plugin 'surround.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" auto-approve removal

" Powerline Support
set laststatus=2
set encoding=utf-8
set ambiwidth=single

set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

set shell=/usr/local/bin/zsh\ -l

if has("gui_running")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    set guioptions-=L
    set guioptions-=T
    set guioptions-=r
    let g:Powerline_symbols = 'fancy'
  endif
else
  set term=xterm-256color
  set t_Co=256
endif

syntax enable
set background=dark
colorscheme solarized
set number

" Split control (https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally)
" Use vim movement controls to change splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree ~/code | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Personal stuff
let mapleader="\<Space>" " Space is the leader
:set mouse=a      " Allows scrolling
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab

" Taken from http://statico.github.io/vim.html

" Make vim's command mode act like emacs
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap <Leader>q :nohlsearch<CR>
