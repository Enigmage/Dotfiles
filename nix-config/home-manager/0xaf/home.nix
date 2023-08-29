# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ../programs/neovim.nix
    ../programs/zsh.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      inputs.neovim-nightly-overlay.overlay
      outputs.overlays.stable-packages
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
    stable.vim
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
    nix-prefetch-github
    borgbackup
    rclone
    lm_sensors
    powertop
    awscli2

    # gui apps
    vlc
    firefox
    brave
    obsidian
    vscode
    guake
    discord
    psensor
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
  programs.wezterm.enable = true;
  programs.chromium.enable = true;
  programs.git.enable = true;
  programs.fzf = {
    enable = true;
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

    ".vimrc".source = ./sources/vim/.vimrc;
    ".vim" = {
      source = ./sources/vim/.vim;
      recursive = true;
    };

    ".config/git" = {
      recursive = true;
      source = ./sources/git;
    };

    ".config/wezterm" = {
      source = ./sources/wezterm;
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
    XDG_DATA_HOME = "/home/alizaidi/.local/share";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
