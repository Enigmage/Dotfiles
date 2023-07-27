{ pkgs, ... }: {

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
}
