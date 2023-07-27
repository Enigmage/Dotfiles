{ config, ... }: {
  # Similar to pop-os hybrid mode
  specialisation = {
    "0xaf-hybrid".configuration = {
      # Possibly turn of nvidia card while not used, better battery.
      # https://discourse.nixos.org/t/how-to-use-nvidia-prime-offload-to-run-the-x-server-on-the-integrated-board/9091/15?u=moritzschaefer

      # gnome service to identify multiple gpu's
      services.switcherooControl.enable = true;
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        powerManagement.enable = true;
        modesetting.enable = true;
        open = false;
        nvidiaPersistenced = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = "PCI:00:02:0";
          nvidiaBusId = "PCI:01:00:0";
        };
      };
    };
  };
}
