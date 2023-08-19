{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
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
      gopls
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
  home.file.".config/nvim" = {
    source = ../sources/nvim;
    recursive = true;
  };
}
