{ pkgs, ... }: {

  programs.git = {
    enable = true;
  };
  home.file.".config/git" = {
    recursive = true;
    source = ../sources/git;
  };
}
