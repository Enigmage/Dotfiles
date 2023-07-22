# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ inputs, lib, config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./asus-vivo-az.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.enableAllFirmware = true;

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
    };
  };
  nixpkgs.overlays = [
    # If you want to use overlays exported from other flakes:
    # neovim-nightly-overlay.overlays.default

    # Or define it inline, for example:
    # (final: prev: {
    #   hi = final.hello.overrideAttrs (oldAttrs: {
    #     patches = [ ./change-hello-to-hi.patch ];
    #   });
    # })
  ];

  networking.hostName = "0xaf"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  # networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  programs.dconf.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      # For windows
      ovmf = {
        enable = true;
        packages = [ pkgs.OVMFFull.fd ];
      };
      swtpm.enable = true;
    };
  };
  virtualisation.docker = {
    enable = true;
    # enableNvidia = true;
    daemon.settings = {
      data-root = "/mnt/Vmstore/docker";
    };
  };
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkbOptions = "ctrl:nocaps";
    # xserver.layout = "us";
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = false;
    # libinput.touchpad.middleEmulation = true;
    # libinput.touchpad.tapping = true;
    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };
  # Might be needed for bluetooth
  # environment.etc = {
  #   "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
  #     		bluez_monitor.properties = {
  #     			["bluez5.enable-sbc-xq"] = true,
  #     			["bluez5.enable-msbc"] = true,
  #     			["bluez5.enable-hw-volume"] = true,
  #     			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
  #     		}
  #     	'';
  # };

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
  # scanning
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
      nvidia-vaapi-driver
      ffmpeg_6-full
    ];
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alizaidi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "scanner" "lp" "libvirtd" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    virt-manager
    pavucontrol

    # DE
    gnomeExtensions.pop-shell
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnome.zenity
    gnome.gnome-tweaks
    gparted
    pop-launcher
    evince
    popsicle

    # core
    wget
    coreutils-full
    pciutils
    exfatprogs # for exFAT
    # possible redundant
    libgccjit
    gccgo12
  ];
  environment.shells = [ pkgs.zsh ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  services.flatpak.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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
  # Timers and crons
  systemd.timers."home-internal-backup" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "home-internal-backup.service";
    };
  };
  systemd.services."home-internal-backup" = {
    path = [
      pkgs.borgbackup
    ];
    script = ''
      ${pkgs.bash}/bin/bash /home/alizaidi/scripts/layer1-home-borg.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "alizaidi";
    };
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

