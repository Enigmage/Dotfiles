# All the environment variables
export EDITOR="nvim"
# export BAT_THEME="Monokai Extended"
# export ZPLUG_HOME=~/.zplug
export FZF_DEFAULT_COMMAND="fdfind . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind -t d . $HOME"
export TERMINAL="st"
export DENO_PATH="/home/alizaidi/.deno"
export FLYCTL_INSTALL="/home/alizaidi/.fly"

# Custom Search paths.
export PATH=$PATH:$FLYCTL_INSTALL/bin/
export PATH=$PATH:~/scripts
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:$DENO_PATH/bin
export PATH=$PATH:/usr/local/go/bin/
export PATH=$PATH:~/go/bin/
# export PATH=$PATH:/usr/lib/x86_64-linux-gnu/pkgconfig

export NVM_DIR="$HOME/.nvm"
# export PATH=$PATH:~/.config/nvim/plugged/fzf/bin/
# export PATH=$PATH:~/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin/
# export PATH=$PATH:~/.config/coc/haskell/
# export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
# export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.local/share:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
# NIX_LINK=/home/alizaidi/.nix-profile
# export LD_LIBRARY_PATH="$NIX_LINK"/lib
# if [ -e /home/alizaidi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/alizaidi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. "$HOME/.cargo/env"
