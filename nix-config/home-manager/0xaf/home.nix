# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }:
let
  shellPackages = with pkgs; [
    stable.vim
    compsize
    htop
    deno
    nodejs_latest
    yarn
    python311
    python311Packages.pip
    python311Packages.mypy
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
    bun
    # Ideally use ghcup for haskell toolchain
    ghc
    haskellPackages.stack
    # awscli2
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "greetme" ''
      echo "Hello, ${config.home.username}!"
    '')
    (pkgs.writeShellScriptBin "nixconf" ''
      cd ~/Dotfiles/nix-config
      nvim home-manager/0xaf/home.nix
    '')
    (pkgs.writeShellScriptBin "nvconf" ''
      cd ~/Dotfiles/nix-config
      nvim home-manager/sources/nvim/init.lua
    '')
    (pkgs.writeShellScriptBin "wezconf" ''
      cd ~/Dotfiles/nix-config
      nvim home-manager/sources/wezterm/wezterm.lua
    '')
  ];
  # guiPackages = with pkgs; [
  #   # vlc
  #   # neovide
  #   # guake
  #   # discord
  # ];
in
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    ../common/neovim.nix
    ../common/zsh.nix
    ../common/tmux.nix
    ../common/git.nix
    ../common/fzf.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      outputs.overlays.stable-packages
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
  targets.genericLinux.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = shellPackages;

  # For the packages with dotfiles managed by home-manager.
  # programs.wezterm.enable = true;
  # programs.chromium.enable = true;
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".vimrc".source = ../sources/vim/.vimrc;
    ".vim" = {
      source = ../sources/vim/.vim;
      recursive = true;
    };

    ".config/wezterm" = {
      source = ../sources/wezterm;
      recursive = true;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # services.syncthing = {
  #   enable = true;
  #   tray = {
  #     enable = false;
  #   };
  # };

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
    # XDG_DATA_HOME = "/home/alizaidi/.local/share:/home/alizaidi/.nix-profile/share";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
