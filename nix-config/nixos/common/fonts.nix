{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      open-sans
      fira-code
      fira-code-symbols
      (google-fonts.override { fonts = [ "Fira Sans Condensed" "Roboto" ]; })
      hasklig
      jetbrains-mono
    ];
  };
}
