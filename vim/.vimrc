" Minimal and easily reproducible vimrc
" Basic settings
filetype plugin indent on
syntax on
set nocompatible
set nowrap
set mouse=a
set lazyredraw
set encoding=utf-8
set title
set confirm
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=85
set expandtab
set smartindent
set autoindent
set expandtab
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

" Better split navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l

" look and feel
" To make colors work in st.
set bg=dark
colorscheme nord
source ~/.vim/statusline.vim
