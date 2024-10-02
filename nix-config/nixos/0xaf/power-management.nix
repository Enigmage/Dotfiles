{ ... }: {
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
}
