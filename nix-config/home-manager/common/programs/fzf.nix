{ pkgs, ... }: {

  programs.fzf = {
    enable = true;
    changeDirWidgetCommand = "fd --type d . ~";
  };
}
