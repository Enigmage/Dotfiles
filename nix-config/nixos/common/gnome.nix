{ pkgs, ... }: {

  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gedit
    epiphany
    geary
    gnome-characters
    gnome-contacts
    gnome-initial-setup
    gnome-maps
  ]);
  environment.systemPackages = with pkgs; [
    gnomeExtensions.pop-shell
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnome.zenity
    gnome.gnome-tweaks
    gparted
    pop-launcher
    evince
  ];
}
