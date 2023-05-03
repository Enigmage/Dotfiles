# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# Aliases
alias nv='nvim'
alias v='vim'
alias ls='ls --color=auto' 
alias vconf='vim ~/.vimrc'
alias alaconf='nvim ~/.config/alacritty/alacritty.yml'
alias zconf='nvim ~/.zshrc'
alias t='tmux'
alias at='alacritty-themes'
alias nve='floaterm'
alias bat='batcat'
alias todo='nv ~/Documents/productivity/cs/todos/'
alias sh='bash'
alias reddit='rtv --theme colorblind-dark'
# Git
alias gch='git checkout'
alias gr='git remote'
alias gst='git status'
alias gl='git log'
alias gp='git push'
alias ga='git add'
alias gco='git commit'
alias gb='git branch'
alias gm='git merge'
alias api-ssh='ssh root@68.183.88.45'
alias api2-ssh='ssh ubuntu@35.154.71.34'
alias url-ssh='ssh ubuntu@13.232.88.118'
alias static-ssh='ssh ubuntu@15.206.70.213'
alias xmonaconf='nv ~/.config/xmonad/xmonad.hs'
alias xmobaconf='nv ~/.config/xmobar/xmobarrc'
alias addbacklinks="sed -i '1s/^/Back to [index](index.md)\n\n /' *.md"
alias home-rsync="rsync -av --include-from=/home/alizaidi/rsync-backup-config/rsync-backup.txt /home/alizaidi/ /home/alizaidi/Backups/home"
alias home-rsync-restore="rsync -av /home/alizaidi/Backups/home/ /home/alizaidi/test-backup"

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


#---------Plugins------------------
#----Theme--------
# source ~/zsh-plugins/denysdovhan/spaceship-prompt/spaceship.zsh 2> /dev/null
# SPACESHIP_VI_MODE_SHOW=false
source ~/zsh-plugins/minimal/minimal.zsh 2> /dev/null
# source ~/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme 
#-----------------
# fzf
source ~/.fzf.zsh 2> /dev/null
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# # Syntax highlighting
source ~/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# # Autosuggestions
source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "/home/alizaidi/.ghcup/env" ] && source "/home/alizaidi/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/alizaidi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/alizaidi/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/alizaidi/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/alizaidi/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

