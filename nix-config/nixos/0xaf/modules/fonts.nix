{ pkgs, ... }: {
  fonts.fonts = with pkgs; [
    noto-fonts
    open-sans
    fira-code
    fira-code-symbols
  ];
}
