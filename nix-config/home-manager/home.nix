# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      inputs.neovim-nightly-overlay.overlay

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alizaidi";
  home.homeDirectory = "/home/alizaidi";
  # targets.genericLinux.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neofetch
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
    nix-prefetch
    borgbackup

    # gui apps
    vlc
    firefox
    # brave
    obsidian
    wezterm
    vscode
    guake
    discord
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
  # programs.chromium.enable = true;
  programs.git.enable = true;
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [
      packer-nvim
    ];
    extraPackages = with pkgs; [
      luajit
      tree-sitter
      python311Packages.pynvim
      python311Packages.black
      pyright
      nodejs
      gcc
      deno
      nil
      nodePackages.bash-language-server
      nodePackages.prettier
      nodePackages.typescript-language-server
      nodePackages.dockerfile-language-server-nodejs
      # Web (ESLint, HTML, CSS, JSON)
      nodePackages.vscode-langservers-extracted
      lua-language-server
      texlab
      nixpkgs-fmt
      ripgrep
      fd
      clang-tools
      stylua
      gofumpt
      beautysh
    ];
  };
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;
    dotDir = ".config/zsh";
    syntaxHighlighting = {
      enable = true;
    };
    # oh-my-zsh = {
    #   enable = true;
    #   # theme = "minimal";
    #   # theme = "kphoen";
    #   theme = "robbyrussell";
    #   # plugins = [ "vi-mode"];
    # };
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "87e6f5dd4c793f6d980532205aaefe196780606f";
          sha256 = "TR4CyBZ+KoZRs9XDmWE5lJuUXXU1J8E2Z63nt+FS+5w=";
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
      system-switch = "home-manager switch --flake ~/Dotfiles/nix-config#0xaf";
      nv = "nvim";
      wezconf = "nvim ~/.config/wezterm/wezterm.lua";
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
      xmonaconf = "nv ~/.config/xmonad/xmonad.hs";
      xmobaconf = "nv ~/.config/xmobar/xmobarrc";
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
      '';
  };
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    changeDirWidgetCommand = "fd --type d . ~";
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

    ".config/nvim" = {
      source = ./sources/nvim;
      recursive = true;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = false;
    };
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
    DENO_PATH = "/home/alizaidi/.deno";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
