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
set statusline+=%#WildMenu#
set statusline+=\ %t
set statusline+=\ %m
set statusline+=%#LineNr#
set statusline+=\ [%n]
set statusline+=%=
set statusline+=%#Title#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l/%L:%c
set statusline+=\ %p%\%
set statusline+=\ 

