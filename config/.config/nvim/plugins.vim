call plug#begin('~/.config/nvim/plugged')
"--------Extras------------------
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'norcalli/nvim-colorizer.lua'
"---------Utility----------------
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'chrisbra/unicode.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'preservim/vim-markdown', {'for':'markdown'}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'c, cpp'}
Plug 'LnL7/vim-nix', {'for': 'nix'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'mbbill/undotree'
" Plug 'aserebryakov/vim-todo-lists'
" Plug 'sheerun/vim-polyglot'
" Plug 'Yggdroot/indentLine'
" Plug 'vimwiki/vimwiki'
call plug#end()
