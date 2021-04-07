# source ~/.zprofile
# Environment variables 
# source ~/.zshenv

# Aliases
alias nv='nvim'
alias v='vim'
alias ls='ls --color=auto'
alias vconf='vim ~/.vimrc'
alias nvconf='nvim ~/.config/nvim/init.vim'
alias alaconf='v ~/.config/alacritty/alacritty.yml'
alias t='tmux'
alias at='alacritty-themes'
alias nve='floaterm'
alias bat='batcat'
alias todo='nv Tasks/todos/'

# Share history in all sessions
setopt histignorealldups sharehistory

# Completion system
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

# Vim keybindings
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


# Plugins

# Theme
# source ~/zsh-plugins/minimal/minimal.zsh 2> /dev/null
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# fzf
source ~/.fzf.zsh 2> /dev/null
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
# Syntax highlighting
source ~/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Autosuggestions
source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# Git directory listing
source ~/zsh-plugins/k/k.plugin.zsh 2> /dev/null
