" let g:airline_theme='base16_adwaita'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_statusline_ontop=0
" " angled seperator status line
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
set laststatus=2
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'⑆ '.l:branchname.' ':''
endfunction

let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
    else
        let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\%{StatuslineGit()}
set statusline+=%#DiffAdd#
set statusline+=\ »\ %t
set statusline+=\ %m
set statusline+=%#Pmenu#
set statusline+=%<
set statusline+=\ [unicode:%b]
set statusline+=%=
set statusline+=%#TermCursor#
set statusline+=\ λ\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\⟪%{&fileformat}\⟫
set statusline+=\ %p%%
set statusline+=\ %l/%L:%c
" set statusline+=\ wc:%{WordCount()}
set statusline+=\ 
