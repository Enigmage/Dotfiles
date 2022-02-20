"--------------------------------Plugins-----------------------------------
call plug#begin('~/.config/nvim/plugged')
"--------Extras------------------
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'
" Plug 'sainnhe/gruvbox-material'
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
" Plug 'mbbill/undotree'
" Plug 'aserebryakov/vim-todo-lists'
" Plug 'sheerun/vim-polyglot'
" Plug 'Yggdroot/indentLine'
" Plug 'vimwiki/vimwiki'
call plug#end()
so ~/.config/nvim/statusline.vim
"--------------------------------Base---------------------------------------
let mapleader=" "
set nowrap
set mouse=a
set scrolloff=3
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
filetype plugin indent on
set incsearch hlsearch
set inccommand=split
set cursorline
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=auto
set nobackup
set nowritebackup
set undofile
set undodir=~/.config/nvim/undodir/
set noswapfile
set colorcolumn=80
set conceallevel=2
" set foldmethod=indent
""highlight ColorColumn ctermbg=0 guibg=lightgrey
setlocal omnifunc=syntaxcomplete#Complete
autocmd CompleteDone * pclose " Close preview when done
" --------------------------------General Keybinds-----------------------------
" Toggle folds
nnoremap <Space>if :setlocal foldmethod=indent<CR>
" Move selected lines up and down a file.
xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv

nnoremap <down> :bw<CR>

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ` ``<Esc>i

inoremap <c-x><c-k> <c-x><c-k>
inoremap jk <ESC>
" keep stuff hightlighted after indent
vnoremap < <gv
vnoremap > >gv

" Arroy keys bad
noremap <up> <nop>
nnoremap <right> gt
nnoremap <left> gT

imap <down> <nop>
imap <up> <nop>
imap <left> <nop>
imap <right> <nop>

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

" Program execution keybinds
noremap \g :FloatermNew cppc %<CR>
noremap \c :FloatermNew cgcc %<CR>
noremap \p :FloatermNew python3 %<CR>
"------------------Snippets/Completion-----------------------------------------

"" Use tab for autocomplete.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
""nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)


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
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

let g:python3_host_prog="/usr/bin/python3"
"emmet config
"Disable for all except html,css
let g:user_emmet_install_global=0 
autocmd FileType *html*,css,*javascript*,*typescript* EmmetInstall
let g:user_emmet_leader_key=','
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <F6> :Prettier<CR>

"------------------------------ColorScheme Settings----------------------------
"---Gruvbox--------------------
let g:gruvbox_italic=1
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark='soft'

"---Gruvbox-material-----------
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1

"-----Everforest---------------
let g:everforest_background='hard'
let g:everforest_enable_italic = 1
let g:everforest_disable_italic_comment = 0
let g:everforest_transparent_background = 0

"----One Dark-------------------
let g:one_allow_italics=1
"-------------------------------
set bg=dark
colorscheme one
" highlight Normal guibg=none
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
lua require'colorizer'.setup()
"---------------------------Markup/Prose---------------------------------------
let g:tex_flavor = 'latex'
" " autocmd Filetype tex,md,txt,vimwiki :setlocal spell
" let g:vimwiki_list = [{'path': '~/vimwiki/'
"                     \ , 'name': 'My knowledge base and diary'
"                     \ ,'path_html':'~/vimwiki/html/'
"                     \ ,'diary_rel_path':'.diary/', }]

let g:vim_markdown_folding_disabled = 1
" let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
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
let g:netrw_winsize = 20

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gr :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
" nnoremap <A-;> :History:<CR>
" nnoremap <A-m> :Marks<CR>
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
let g:fzf_layout = { 'down': '40%' }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"-------------------------Terminal---------------------------------------------
" turn terminal to normal mode with escape
set splitright splitbelow
tnoremap <C-[> <C-\><C-n>
hi FloatermBorder guifg=none guibg=none
hi Floaterm guibg=none
let g:floaterm_title="zsh($1/$2)"
let g:floaterm_position="center"
let g:floaterm_opener="edit"
let g:floaterm_autoinsert="false"
let g:floaterm_keymap_new="\\f"
let g:floaterm_keymap_toggle="\\t"
let g:floaterm_width=0.5
let g:floaterm_height=0.9
noremap \s :FloatermSend<CR>
"------------------------StartScreen-------------------------------------------
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
            \ { 'type': 'dir'       },
            \ { 'type': 'files'     },
            \ { 'type': 'sessions'  },
            \ { 'type': 'bookmarks' },
            \ { 'type': 'commands' },
            \ ]

" bookmark examples
let  g:startify_bookmarks =  [
            \ {'v': '~/.config/nvim'},
            \ {'d': '~/.dotfiles' }
            \ ]

" custom commands
let g:startify_commands = [
            \ {'ch':  ['Health Check', ':checkhealth']},
            \ {'ps': ['Plugins status', ':PlugStatus']},
            \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
            \ {'uc': ['Update coc Plugins', ':CocUpdate']},
            \ {'h':  ['Help', ':help']},
            \ ]

" custom banner
let g:startify_custom_header = [
\ '',
\ '                                                                ▟▙            ',
\ '                                                                ▝▘            ',
\ '                        ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
\ '                        ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
\ '                        ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
\ '                        ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
\ '                        ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
\ '',
\ '',
\ '',
\]
"-----------------------FireNvim-----------------------------------------------
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }
if exists('g:started_by_firenvim')
    set colorcolumn=
    set nocursorline
    let g:gruvbox_italic=1
    let g:gruvbox_improved_strings=1
    let g:gruvbox_improved_warnings=1
    let g:gruvbox_contrast_dark="hard"
    colorscheme everforest
    set bg=dark
    set laststatus=0
    nnoremap <C-s> :wq<CR>
    au BufEnter 202.12.103.189_*.txt set filetype=sql
endif
