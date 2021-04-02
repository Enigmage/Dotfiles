call plug#begin('~/.config/nvim/plugged')
"--------Extras------------------
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
" Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'
"---------Utility----------------
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'aserebryakov/vim-todo-lists'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
