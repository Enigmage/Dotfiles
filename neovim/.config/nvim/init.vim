"--------------------Plugins---------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
"--------Vanity------------------
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
" Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'plasticboy/vim-markdown', {'for' : 'markdown, vimwiki'}
Plug 'octol/vim-cpp-enhanced-highlight', { 'for' : 'c, cpp'}
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex', {'for': 'tex'}
" Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
call plug#end()
"--------------------------------Core------------------------------------------
"---------------Statusline-------------
so ~/.config/nvim/statusline.vim
"--------------------------------------
set nowrap
set mouse=a
set scrolloff=3
set lazyredraw
set encoding=utf-8
set title
set confirm
set number relativenumber
" Tab/indent config
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
"--------------
set fileformat=unix
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
" set foldmethod=indent

" Map the leader to space
let mapleader=" "
syntax on
filetype plugin indent on
""highlight ColorColumn ctermbg=0 guibg=lightgrey
setlocal omnifunc=syntaxcomplete#Complete
" Close preview when done
" autocmd CompleteDone * pclose 
" set list
" set lcs=eol:↵
"-----keybindings----------------------
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

"something to do with omni completion
inoremap <c-x><c-k> <c-x><c-k>
inoremap jk <ESC>
" keep stuff hightlighted after indent
vnoremap < <gv
vnoremap > >gv

" Arroy keys bad
noremap <up> <nop>
nnoremap <right> gt
nnoremap <left> gT

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
"-----------------Files/Explorer-------
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
noremap <silent> <C-n> :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

"-------------------------------Extended---------------------------------------
" True color support
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
"--------------ColorScheme Settings----
"---Gruvbox-----------
let g:gruvbox_italic=1
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark='hard'

"---Gruvbox-material----
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_better_performance = 1

"-----Everforest----------
let g:everforest_background='hard'
let g:everforest_enable_italic = 1
let g:everforest_disable_italic_comment = 0
let g:everforest_transparent_background = 0

"----One Dark-------------------
let g:one_allow_italics=1
"-------------------------------
set bg=dark
colorscheme nord
" highlight Normal guibg=none
" Setup nvim colorizer.
lua require'colorizer'.setup()
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
" inoremap <silent><expr> <c-space> coc#refresh()

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

"---------------------------Markup/Prose---------------------------------------
let g:tex_flavor = 'latex'
" autocmd Filetype tex,md,txt,vimwiki :setlocal spell
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext=0
let g:vimwiki_list = [{'path': '~/vimwiki/'
                    \ ,'name': 'My knowledge base and diary'
                    \ ,'path_html':'~/vimwiki/html/'
                    \ ,'custom_wiki2html': '~/scripts/convert.py'
                    \ ,'diary_rel_path':'.diary/'
                    \ ,'auto_generate_links':1
                    \ ,'syntax': 'markdown', 'ext':'.md'}]
"TODO: show files for currently selected wiki.
nnoremap <Leader>wf :Files ~/vimwiki/<CR>

"-----------------------------------FZF----------------------------------------
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gr :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :Marks<CR>
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
let g:floaterm_title="Zsh($1/$2)"
let g:floaterm_position="topright"
let g:floaterm_opener="edit"
let g:floaterm_autoinsert="false"
let g:floaterm_keymap_new="\\f"
let g:floaterm_keymap_toggle="\\t"
let g:floaterm_width=0.5
let g:floaterm_height=0.9
noremap \s :FloatermSend<CR>
" Program execution keybinds
noremap \g :FloatermNew cppc %<CR>
noremap \c :FloatermNew cgcc %<CR>
noremap \p :FloatermNew python3 %<CR>
"------------------------StartScreen-------------------------------------------
let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
" Disable indent lines to render startscreen graphic properly.
" autocmd FileType startify IndentLinesDisable
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
    colorscheme gruvbox
    set bg=dark
    set laststatus=2
    nnoremap <C-s> :wq<CR>
    au BufEnter 202.12.103.189_*.txt set filetype=sql
endif
""---------------------IndentLine-----------------------------------------------
"set list lcs=tab:\|\ 
"let g:indentLine_defaultGroup = 'TermCursorNC'
"let g:indentLine_char_list = ['|']
