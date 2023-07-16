{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alizaidi";
  home.homeDirectory = "/home/alizaidi";
  # targets.genericLinux.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neofetch
    neovim
    vim
    compsize
    htop
    deno
    nodejs_20
    yarn
    python311
    python311Packages.pip
    go
    cargo
    rustc
    unzip
    xclip
    fd

    # gui apps
    vlc
    firefox
    brave
    obsidian
    wezterm
    vscode
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # For the packages with dotfiles managed by home-manager.
  programs.git.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;
    dotDir = ".config/zsh";
    syntaxHighlighting = {
      enable = true;
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
    history = {
      size = 3000;
      save = 3000;
      share = true;
    };
    shellAliases = {
      nv = "nvim";
      nvconf = "cd ~/.config/nvim && nvim init.lua";
      hmconf = "cd ~/.config/home-manager && nvim home.nix";
      nxconf = "cd ~/.config/nixos && nvim .";
      # alaconf = "nvim ~/.config/alacritty/alacritty.yml";
      wezconf = "nvim ~/.config/wezterm/wezterm.lua";
      # zconf = "nvim ~/.zshrc";
      # t = "tmux";
      # at = "alacritty-themes";
      # nve = "floaterm";
      bat = "batcat";
      # todo = "nv ~/Documents/productivity/cs/todos/";
      # sh = "bash";
      # reddit = "rtv - -theme colorblind-dark";
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
      xmonaconf = "nv ~/.config/xmonad/xmonad.hs";
      xmobaconf = "nv ~/.config/xmobar/xmobarrc";
      #addbacklinks = "sed -i "1s\/\^/Back to [ index ] (index.md)\n\n /" *.md";
      home-rsync = "rsync -av
        --include-from=/home/alizaidi/rsync-backup-config/rsync-backup.txt
        /home/alizaidi/ /home/alizaidi/Backups/home";
      home-rsync-restore = "rsync -av /home/alizaidi/Backups/home/
      /home/alizaidi/test-backup";
    };
    initExtra =
      ''
        zstyle ':completion:*' menu select
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
      '';
    envExtra =
      ''
        export PATH=$PATH:~/scripts
        export DENO_PATH="/home/alizaidi/.deno";
      '';
  };
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    changeDirWidgetCommand = "fd --type d";
  };
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    prefix = "C-a";
    extraConfig =
      ''
        set -g default-terminal "screen-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        bind r source-file ~/.tmux.conf
        set-option -sg escape-time 10
        set-option -g focus-events on
        set -g status-style ""
        set-option -g status-position bottom
        set -g status-right ""
      '';
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/git" = {
      recursive = true;
      source = ./sources/git;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/alizaidi/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
