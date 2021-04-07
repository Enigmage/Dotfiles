" 🙋 Welcome to my rice field.😊
" --------------------------------Components-----------------------------------
so ~/.config/nvim/plugins.vim
so ~/.config/nvim/statusline.vim
"--------------------------------General---------------------------------------
set nowrap
set mouse=a
set scrolloff=5
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
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Program execution keybinds
map <Leader>g :FloatermNew --autoclose=0 --position=topright --height=0.93 --width=0.5 cppc %<CR>
map <Leader>c :FloatermNew --autoclose=0 --position=topright --height=0.93 --width=0.5 cgcc %<CR>
map <Leader>p :FloatermNew --autoclose=0 --position=topright --height=0.93 --width=0.5 python3 %<CR>
map <Leader>n :FloatermNew --autoclose=0 --position=topright --height=0.93 --width=0.5 node %<CR>
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

"emmet config
"Disable for all except html,css
let g:user_emmet_install_global=0 
autocmd FileType *html*,css,*javascript*,*typescript* EmmetInstall
let g:user_emmet_leader_key=','

let g:python3_host_prog="~/.local/share/virtualenvs/neovim-TNDyTgHi/bin/python3.8"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
map <F6> :Prettier<CR>

"------------------------------ColorScheme Settings----------------------------
colorscheme gruvbox
let g:one_allow_italics=1
set bg=dark
highlight Normal guibg=none

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
" let g:vimsence_small_text='NeoVim'
" let g:vimsence_small_image='neovim'
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

"-------------------------Terminal---------------------------------------------
" turn terminal to normal mode with escape
tnoremap <C-[> <C-\><C-n>
hi FloatermBorder guifg=cyan  guibg=black
hi Floaterm guibg=black
map <Leader>f :FloatermNew --position=right --height=0.97 --width=0.5<CR><C-[>
map <Leader>t :FloatermToggle<CR><C-[>
map <Leader>h :FloatermPrev<CR><C-[>
map <Leader>l :FloatermNext<CR><C-[>
map <Leader>s :FloatermSend<CR>
"------------------------StartScreen-------------------------------------------
let g:startify_bookmarks = [ {'c' : '~/.config/nvim/init.vim'},{'p' : '~/Developement/chat_app'},]
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
