" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'lewis6991/impatient.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'luisiacc/gruvbox-baby', { 'branch': 'main'}
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'numToStr/Comment.nvim'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'preservim/vim-markdown', { 'for' : 'markdown' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vimwiki/vimwiki'
" Plug 'andweeb/presence.nvim'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

" Options
set nowrap
set mouse=a
set scrolloff=5
set lazyredraw
set title
set confirm
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set textwidth=85
set inccommand=split
set cursorline
set updatetime=1000
set shortmess+=c
set nowritebackup
set undofile
set undodir=~/.config/nvim/undodir/
set noswapfile
set colorcolumn=80
set conceallevel=0
set splitright splitbelow
set list lcs=tab:\|\ ,trail:-,nbsp:+,eol:↵
set winbar=%t%M%=Unicode:%b
set termguicolors
" set omnifunc=v:lua.vim.lsp.omnifunc

" Lua packages
lua require("ali")
" Keymaps
let mapleader=" "

xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv

inoremap jk <ESC>
" keep stuff hightlighted after indent
vnoremap < <gv
vnoremap > >gv

" Arroy keys bad
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Easier split navigation
" Navigate splits and buffers in any mode.
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

" Commands
augroup GeneralCommands
    autocmd!
    " autocmd CompleteDone * pclose " Close preview when done
augroup END


let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

let g:python3_host_prog="/usr/bin/python3"
"emmet config
"Disable for all except html,css
let g:user_emmet_install_global=0 
let g:user_emmet_leader_key=','
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
function WebDevOptions()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal textwidth=120
    setlocal expandtab
    setlocal colorcolumn=120
    EmmetInstall
endfunction

autocmd GeneralCommands FileType *html*,*css*,*javascript*,*typescript* call WebDevOptions()

" Colorscheme
let g:gruvbox_baby_background_color="dark"
" let g:gruvbox_baby_transparent_mode="true"
colorscheme gruvbox-baby
" hi Normal guibg=none
hi WinSeparator guibg=none

" Markup
let g:tex_flavor = 'latex'
" let g:tex_conceal = ""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_strikethrough = 1
" let g:vim_markdown_json_frontmatter = 1
" let g:vim_markdown_toml_frontmatter = 1

" Files
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
noremap <silent> <C-n> :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_alto = 0
let g:netrw_winsize = 45

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gr :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
" nnoremap <A-;> :History:<CR>
" nnoremap <A-m> :Marks<CR>
"
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
" let g:fzf_layout = { 'down': '40%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Terminal
" turn terminal to normal mode with escape
tnoremap <C-[> <C-\><C-n>
" Program execution keybinds
nnoremap \c :vsplit term://cppc %<CR>
nnoremap \p :vsplit term://python3 %<CR>
nnoremap \rp :split term://python3<CR>
nnoremap \t :vsplit term://zsh<CR>

" Old configs for reference
" let g:firenvim_config = { 
"     \ 'globalSettings': {
"         \ 'alt': 'all',
"     \  },
"     \ 'localSettings': {
"         \ '.*': {
"             \ 'cmdline': 'neovim',
"             \ 'content': 'text',
"             \ 'priority': 0,
"             \ 'selector': 'textarea',
"             \ 'takeover': 'never',
"         \ },
"     \ }
" \ }
" if exists('g:started_by_firenvim')
"     set colorcolumn=
"     set nocursorline
"     let g:gruvbox_italic=1
"     let g:gruvbox_improved_strings=1
"     let g:gruvbox_improved_warnings=1
"     let g:gruvbox_contrast_dark="hard"
"     colorscheme everforest
"     set bg=dark
"     set laststatus=0
"     nnoremap <C-s> :wq<CR>
"     au BufEnter 202.12.103.189_*.txt set filetype=sql
" endif
" inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
" inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
" inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
" inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"
"
" inoremap <silent><expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
" inoremap <silent><expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
"
" inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
" inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
"
" " Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" ""nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <Leader>do <Plug>(coc-codeaction)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     elseif (coc#rpc#ready())
"         call CocActionAsync('doHover')
"     else
"         execute '!' . &keywordprg . " " . expand('<cword>')
"     endif
" endfunction
"
" " Highlight the symbol and its references when holding the cursor.
" autocmd GeneralCommands CursorHold * silent call CocActionAsync('highlight')
"
" " Symbol renaming.
" nmap <Leader>rn <Plug>(coc-rename)
