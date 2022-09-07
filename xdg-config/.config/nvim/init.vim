" Disables all filetype plugins
" let g:did_load_filetypes=1
"--------------------------------Plugins---------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
" Plug 'andweeb/presence.nvim'
"------------------------------------------------------------------------------
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'chrisbra/unicode.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex', { 'for': 'tex' }
" Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'preservim/vim-markdown', { 'for' : 'markdown' }
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell'}
Plug 'octol/vim-cpp-enhanced-highlight', { 'for' : ['c', 'cpp']}
Plug 'pangloss/vim-javascript', {'for' : ['javascript', 'javascriptreact']}
Plug 'leafgarland/typescript-vim',{'for' : ['typescript', 'typescriptreact']}
Plug 'maxmellon/vim-jsx-pretty', {'for' : ['typescriptreact', 'javascriptreact']}  
Plug 'LnL7/vim-nix', { 'for' : 'nix' }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
Plug 'tomlion/vim-solidity', { 'for' : 'solidity' }
" Plug 'vimwiki/vimwiki'
call plug#end()
"----------------------Statusline----------------------------------------------
" so ~/.config/nvim/statusline.vim
lua << END
local config = require("ali.statusline")
require("lualine").setup(config)
END
"----------------------Options-------------------------------------------------
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
"setlocal omnifunc=syntaxcomplete#Complete

" --------------------------------Keymaps--------------------------------------
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
"-----------------------------Commands-----------------------------------------
augroup GeneralCommands
    autocmd!
augroup END

inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"

inoremap <silent><expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
inoremap <silent><expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"

inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"


" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
""nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>do <Plug>(coc-codeaction)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd GeneralCommands CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)

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
    noremap <F6> :CocCommand prettier.formatFile<CR>
endfunction

autocmd GeneralCommands FileType *html*,*css,*javascript*,*typescript* call WebDevOptions()

"------------------------------ColorScheme Settings----------------------------
"----One Dark-------------------
let g:one_allow_italics=1
"-------------------------------
set bg=dark
colorscheme one
hi Normal guibg=none
hi WinSeparator guibg=none
lua require("colorizer").setup()
"---------------------------Markup/Prose---------------------------------------
let g:tex_flavor = 'latex'
" let g:tex_conceal = ""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" let g:vimwiki_list = [{'path': '~/vimwiki/'
"                     \ , 'name': 'My knowledge base and diary'
"                     \ ,'path_html':'~/vimwiki/html/'
"                     \ ,'diary_rel_path':'.diary/', }]
" let g:vim_markdown_strikethrough = 1
" let g:vim_markdown_json_frontmatter = 1
" let g:vim_markdown_toml_frontmatter = 1
"---------------------------Files/Explorer-------------------------------------
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

"-------------------------Terminal---------------------------------------------
" turn terminal to normal mode with escape
tnoremap <C-[> <C-\><C-n>
" Program execution keybinds
nnoremap \c :vsplit term://cppc %<CR>
nnoremap \p :vsplit term://python3 %<CR>
nnoremap \rp :split term://python3<CR>
nnoremap \t :vsplit term://zsh<CR>
"-----------------------FireNvim-----------------------------------------------
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
"----------------------------Rich Presence-------------------------------------
"let g:presence_auto_update         = 1
"let g:presence_neovim_image_text   = "The One True Text Editor"
"let g:presence_main_image          = "neovim"
"let g:presence_client_id           = "793271441293967371"
"""let g:presence_log_level
"let g:presence_debounce_timeout    = 10
"let g:presence_enable_line_number  = 0
"let g:presence_blacklist           = []
"let g:presence_buttons             = 1
"let g:presence_file_assets         = {}

"" Rich Presence text options
"let g:presence_editing_text        = "Editing %s"
"let g:presence_file_explorer_text  = "Browsing %s"
"let g:presence_git_commit_text     = "Committing changes"
"let g:presence_plugin_manager_text = "Managing plugins"
"let g:presence_reading_text        = "Reading %s"
"let g:presence_workspace_text      = "Working on %s"
"let g:presence_line_number_text    = "Line %s out of %s"
