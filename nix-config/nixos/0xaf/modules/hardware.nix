# It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  # boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/c7d0c8a5-1f5c-406f-b68b-6e4471e2ac8b";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/c7d0c8a5-1f5c-406f-b68b-6e4471e2ac8b";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/c7d0c8a5-1f5c-406f-b68b-6e4471e2ac8b";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/c7d0c8a5-1f5c-406f-b68b-6e4471e2ac8b";
      fsType = "btrfs";
      options = [ "subvol=swap" "compress=no" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/26EB-A05D";
      fsType = "vfat";
    };

  fileSystems."/mnt/Shack" =
    {
      device = "/dev/disk/by-uuid/f89551f9-3cdb-4bea-95ac-3440379661f5";
      fsType = "btrfs";
      options = [ "subvol=Shack" "noatime" "compress=zstd" ];
    };

  fileSystems."/mnt/Vmstore" =
    {
      device = "/dev/disk/by-uuid/f89551f9-3cdb-4bea-95ac-3440379661f5";
      fsType = "btrfs";
      options = [ "subvol=Vmstore" "noatime" "compress=zstd" ];
    };
  fileSystems."/mnt/home-borg" =
    {
      device = "/dev/disk/by-uuid/f89551f9-3cdb-4bea-95ac-3440379661f5";
      fsType = "btrfs";
      options = [ "subvol=home-borg" "noatime" "compress=zstd" ];
    };

  swapDevices = [{ device = "/swap/swapfile"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
