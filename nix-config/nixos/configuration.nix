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

  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
      };
    };
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

  };
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

  # for ssd
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

    # core
    wget
    coreutils-full
    pciutils
    exfatprogs # for exFAT
    # possible redundant
    libgccjit
    gccgo12
  ];
  # to run generic binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    fuse3
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    libGL
    libappindicator-gtk3
    libdrm
    libnotify
    libpulseaudio
    libuuid
    libusb1
    xorg.libxcb
    libxkbcommon
    mesa
    nspr
    nss
    pango
    pipewire
    systemd
    icu
    openssl
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libxkbfile
    xorg.libxshmfence
    zlib
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

  # power management
  # https://github.com/NixOS/nixpkgs/issues/211345
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    # extraConfig = builtins.readFile ./tlp.conf;
    settings = {
      # https://gist.github.com/pauloromeira/787c75d83777098453f5c2ed7eafa42a
      # Set to 0 to disable, 1 to enable TLP.
      TLP_ENABLE = 1;
      # Operation mode when no power supply can be detected: AC, BAT
      # Concerns some desktop and embedded hardware only.
      TLP_DEFAULT_MODE = "AC";
      # Operation mode select: 0=depend on power source, 1=always use TLP_DEFAULT_MODE
      # Hint: use in conjunction with TLP_DEFAULT_MODE=BAT for BAT settings on AC
      TLP_PERSISTENT_DEFAULT = 0;
      # Seconds laptop mode has to wait after the disk goes idle before doing a sync.
      # Non-zero value enables, zero disables laptop mode.
      DISK_IDLE_SECS_ON_AC = 0;
      DISK_IDLE_SECS_ON_BAT = 2;
      # Dirty page values (timeouts in secs).
      MAX_LOST_WORK_SECS_ON_AC = 15;
      MAX_LOST_WORK_SECS_ON_BAT = 60;
      # Set energy performance hints (HWP) for Intel P-state governor:
      #   default, performance, balance_performance, balance_power, power
      # Values are given in order of increasing power saving.
      # Note: Intel Skylake or newer CPU and Kernel >= 4.10 required.
      CPU_HWP_ON_AC = "balance_performance";
      CPU_HWP_ON_BAT = "balance_power";
      # Minimize number of used CPU cores/hyper-threads under light load conditions
      SCHED_POWERSAVE_ON_AC = 0;
      SCHED_POWERSAVE_ON_BAT = 1;
      # Kernel NMI Watchdog:
      #   0=disable (default, saves power), 1=enable (for kernel debugging only)
      NMI_WATCHDOG = 0;
      # Set CPU performance versus energy savings policy:
      #   performance, normal, powersave
      # Requires kernel module msr and x86_energy_perf_policy from linux-tools
      ENERGY_PERF_POLICY_ON_AC = "performance";
      ENERGY_PERF_POLICY_ON_BAT = "powersave";
      # Hard disk devices; separate multiple devices with spaces (default: sda).
      # Devices can be specified by disk ID also (lookup with: tlp diskid).
      DISK_DEVICES = "sda sdb";
      # Hard disk advanced power management level: 1..254, 255 (max saving, min, off)
      # Levels 1..127 may spin down the disk; 255 allowable on most drives.
      # Separate values for multiple disks with spaces. Use the special value 'keep'
      # to keep the hardware default for the particular disk.
      DISK_APM_LEVEL_ON_AC = "254 254";
      DISK_APM_LEVEL_ON_BAT = "128 128";
      # SATA aggressive link power management (ALPM):
      #   min_power, medium_power, max_performance
      SATA_LINKPWR_ON_AC = "max_performance";
      SATA_LINKPWR_ON_BAT = "min_power";
      # Seconds of inactivity before disk is suspended
      AHCI_RUNTIME_PM_TIMEOUT = 15;
      # PCI Express Active State Power Management (PCIe ASPM):
      #   default, performance, powersave
      PCIE_ASPM_ON_AC = "performance";
      PCIE_ASPM_ON_BAT = "powersave";
      # WiFi power saving mode: on=enable, off=disable; not supported by all adapters.
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";
      # Disable wake on LAN: Y/N
      WOL_DISABLE = "Y";
      # Enable audio power saving for Intel HDA, AC97 devices (timeout in secs).
      # A value of 0 disables, >=1 enables power saving.
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;
      # Disable controller too (HDA only): Y/N
      SOUND_POWER_SAVE_CONTROLLER = "Y";
      # Power off optical drive in UltraBay/MediaBay: 0=disable, 1=enable.
      # Drive can be powered on again by releasing (and reinserting) the eject lever
      # or by pressing the disc eject button on newer models.
      # Note: an UltraBay/MediaBay hard disk is never powered off.
      BAY_POWEROFF_ON_AC = 0;
      BAY_POWEROFF_ON_BAT = 0;
      # Optical drive device to power off (default sr0).
      BAY_DEVICE = "sr0";
      # Runtime Power Management for PCI(e) bus devices: on=disable, auto=enable
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";
      # Set to 0 to disable, 1 to enable USB autosuspend feature.
      USB_AUTOSUSPEND = 1;
      # Bluetooth devices are excluded from USB autosuspend:
      #   0=do not exclude, 1=exclude
      USB_BLACKLIST_BTUSB = 0;
      # Phone devices are excluded from USB autosuspend:
      #   0=do not exclude, 1=exclude (enable charging)
      USB_BLACKLIST_PHONE = 0;
      # WWAN devices are excluded from USB autosuspend:
      #   0=do not exclude, 1=exclude
      USB_BLACKLIST_WWAN = 1;
      # Restore radio device state (Bluetooth, WiFi, WWAN) from previous shutdown
      # on system startup: 0=disable, 1=enable.
      # Hint: the parameters DEVICES_TO_DISABLE/ENABLE_ON_STARTUP/SHUTDOWN below
      #   are ignored when this is enabled!
      RESTORE_DEVICE_STATE_ON_STARTUP = 0;
      # Radio devices to disable on connect.
      DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi wwan";
      DEVICES_TO_DISABLE_ON_WIFI_CONNECT = "wwan";
      DEVICES_TO_DISABLE_ON_WWAN_CONNECT = "wifi";
      # Radio devices to enable on disconnect.
      DEVICES_TO_ENABLE_ON_LAN_DISCONNECT = "wifi wwan";
      DEVICES_TO_ENABLE_ON_WIFI_DISCONNECT = "";
      DEVICES_TO_ENABLE_ON_WWAN_DISCONNECT = "";
    };
  };

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

