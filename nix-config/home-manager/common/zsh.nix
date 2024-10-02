{ pkgs, ... }:
{

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    # enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;
    dotDir = ".config/zsh";
    syntaxHighlighting = {
      enable = true;
    };
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "a02209d36c8509c0e62f44324127632999c9c0cf";
          sha256 = "BmQO4xqd/3QnpLUitD2obVxL0UulpboT8jGNEh4ri8k=";
        };
      }
    ];
    history = {
      size = 3000;
      save = 3000;
      share = true;
    };
    shellAliases = {
      home-switch = "home-manager switch --flake ~/Dotfiles/nix-config#alizaidi@0xaf";
      work-switch = "home-manager switch --flake ~/Dotfiles/nix-config#alizaidi@w-pf3xkjnm";
      system-switch = "sudo nixos-rebuild switch --flake ~/Dotfiles/nix-config#0xaf";
      nv = "nvim";
      # at = "alacritty-themes";
      bat = "batcat";
      gch = "git checkout";
      gr = "git remote";
      gst = "git status";
      gl = "git log";
      gp = "git push";
      ga = "git add";
      gco = "git commit";
      gb = "git branch";
      gm = "git merge";
      # api-ssh = "ssh root@68.183.88.45";
      # api2-ssh = "ssh ubuntu@35.154.71.34";
      # url-ssh = "ssh ubuntu@13.232.88.118";
      # static-ssh = "ssh ubuntu@15.206.70.213";
      #addbacklinks = "sed -i "1s\/\^/Back to [ index ] (index.md)\n\n /" *.md";
    };
    initExtra =
      ''
        zstyle ':completion:*' menu select
        # enable vi mode
        bindkey -v
        export KEYTIMEOUT=1

        # Use vim keys in tab complete menu:
        # bindkey -M menuselect 'h' vi-backward-char
        # bindkey -M menuselect 'k' vi-up-line-or-history
        # bindkey -M menuselect 'l' vi-forward-char
        # bindkey -M menuselect 'j' vi-down-line-or-history
        # bindkey -v '^?' backward-delete-char

        # Edit line in vim with ctrl-e:
        autoload edit-command-line; zle -N edit-command-line
        bindkey '^e' edit-command-line
      '';
    envExtra =
      ''
        export PATH=$PATH:~/scripts
        export PATH=$PATH:$DENO_PATH/bin
        export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.nix-profile/share/applications
      '';
  };
}
