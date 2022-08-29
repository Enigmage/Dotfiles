"source ~/.vim/statusline.vim
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
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set expandtab
filetype plugin indent on
set cursorline
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=auto
"set undofile
"set undodir='~/.vim/undodir'
set colorcolumn=80
setlocal omnifunc=syntaxcomplete#Complete 						 
autocmd CompleteDone * pclose " Close preview when done

set incsearch hlsearch ignorecase smartcase

set nobackup noswapfile nowritebackup            " disable backup/swap files

" Custom keymaps
let mapleader=" "
nnoremap <leader>r :source %<CR>
nnoremap <leader>t :term<CR>
set splitbelow

nnoremap <C-n> :Lexplore<CR>
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

noremap <left> :bp<CR>
noremap <right> :bn<CR>
inoremap jk <ESC>

xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv
nnoremap <F5> :buffers<CR>:buffer 

" keep stuff hightlighted after indent
vnoremap < <gv
vnoremap > >gv


" Arroy keys bad
imap <down> <nop>
imap <up> <nop>
imap <down> <nop>
imap <up> <nop>

" look and feel
" To make colors work in st.
colorscheme nord
set bg=dark

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
