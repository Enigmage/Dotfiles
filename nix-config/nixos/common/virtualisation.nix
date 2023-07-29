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
  };
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
