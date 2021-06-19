"--------------------------------Components-----------------------------------
so ~/.config/nvim/plugins.vim
so ~/.config/nvim/statusline.vim
"--------------------------------General---------------------------------------
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
set expandtab
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
""highlight ColorColumn ctermbg=0 guibg=lightgrey
setlocal omnifunc=syntaxcomplete#Complete 						 
autocmd CompleteDone * pclose " Close preview when done
" --------------------------------General Keybinds-----------------------------

" Move selected lines up and down a file.
xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv

nnoremap <F5> :UndotreeToggle<CR>
nnoremap <down> :bw<CR>

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ` ``<Esc>i

inoremap <c-x><c-k> <c-x><c-k>
inoremap jj <ESC>
" keep stuff hightlighted after indent
vnoremap < <gv
vnoremap > >gv

" Arroy keys bad
map <up> <nop>
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
map <Leader>g :FloatermNew cppc %<CR>
map <Leader>c :FloatermNew cgcc %<CR>
map <Leader>p :FloatermNew python3 %<CR>
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
map <F6> :Prettier<CR>

"------------------------------ColorScheme Settings----------------------------
let g:gruvbox_italic=1
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme one
set bg=dark
let g:one_allow_italics=1
" highlight Normal guibg=none
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
"---------------------------Markup/Prose---------------------------------------
let g:tex_flavor = 'latex'
autocmd Filetype tex,md,txt :setlocal spell
"---------------------------Files/Explorer-------------------------------------
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
map <silent> <C-n> :Vexplore<CR>
map <silent> <C-q> :q<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

nnoremap <A-f> :Files<CR>
nnoremap <A-r> :Rg<CR>
nnoremap <A-b> :Buffers<CR>
nnoremap <A-;> :History:<CR>
nnoremap <A-m> :Marks<CR>
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
let g:fzf_layout = { 'down': '40%' }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"-------------------------Terminal---------------------------------------------
" turn terminal to normal mode with escape
tnoremap <C-[> <C-\><C-n>
hi FloatermBorder guifg=none guibg=none
hi Floaterm guibg=none
let g:floaterm_title="Zsh($1/$2)"
let g:floaterm_position="topright"
let g:floaterm_opener="edit"
let g:floaterm_autoinsert="false"
let g:floaterm_keymap_new="<Leader>f"
let g:floaterm_keymap_toggle="<Leader>t"
let g:floaterm_width=0.5
let g:floaterm_height=0.9
map <Leader>s :FloatermSend<CR>
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
            \ '                                                    ▟▙            ',
            \ '                                                    ▝▘            ',
            \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
            \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
            \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
            \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
            \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
            \ '',
            \ '',
            \ '',
            \]
"-----------------------FireNvim-----------------------------------------------
if exists('g:started_by_firenvim')
    let g:gruvbox_italic=1
    let g:gruvbox_improved_strings=1
    let g:gruvbox_improved_warnings=1
    let g:gruvbox_contrast_dark="hard"
    colorscheme gruvbox 
    set bg=dark
    set laststatus=0
endif
