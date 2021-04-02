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
set incsearch hlsearch ignorecase smartcase
set cursorline
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=auto
set undofile
set undodir='~/.vim/undodir'
set colorcolumn=80
setlocal omnifunc=syntaxcomplete#Complete 						 
autocmd CompleteDone * pclose " Close preview when done

set incsearch hlsearch ignorecase smartcase

set nobackup noswapfile nowritebackup            " disable backup/swap files
let g:netrw_liststyle = 3

" Custom keymaps
nnoremap ; :
map <leader>r :source %<CR>
map <leader>t :term<CR>
set splitbelow

map <C-n> :Lexplore<CR>
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

map <left> :bp<CR>
map <right> :bn<CR>
map <leader>; :set colorcolumn=81<CR>
inoremap jj <ESC>

xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv
nnoremap <F5> :buffers<CR>:buffer 

" keep stuff hightlighted after indent
vnoremap < <gv
vnoremap > >gv


" Arroy keys bad
map <down> <nop>
map <up> <nop>
imap <down> <nop>
imap <up> <nop>

" Status line
set laststatus=2
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" look and feel
colorscheme gruvbox
set bg=dark

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
