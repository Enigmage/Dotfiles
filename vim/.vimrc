source ~/.vim/statusline.vim
" Minimal and easily reproducible vimrc
" Basic settings
set nocompatible
set nowrap
set mouse=a
set lazyredraw
set encoding=utf-8
set title
set confirm
set number relativenumber
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=85
set expandtab
set smartindent
set autoindent
set expandtab
filetype plugin indent on
set cursorline
set hidden
set updatetime=1000
set shortmess+=c
set colorcolumn=80
setlocal omnifunc=syntaxcomplete#Complete 						 
autocmd CompleteDone * pclose " Close preview when done

set incsearch hlsearch ignorecase smartcase

set nobackup noswapfile nowritebackup            " disable backup/swap files

" Custom keymaps
let mapleader=" "
nnoremap <leader>r :source %<CR>
nnoremap <leader>t :term<CR>
set splitbelow splitright

nnoremap <C-n> :Lexplore<CR>
let g:netrw_banner=0
let g:netrw_winsize=45
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

inoremap jk <ESC>

xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv
nnoremap <F5> :buffers<CR>:buffer 

" keep stuff hightlighted after indent
vnoremap < <gv
vnoremap > >gv


" Arroy keys bad
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <up> <nop>

" look and feel
" To make colors work in st.
set bg=dark
colorscheme nord
