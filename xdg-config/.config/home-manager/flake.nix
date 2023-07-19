{
  description = "Home Manager configuration of alizaidi";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      overlays = [
        inputs.neovim-nightly-overlay.overlay
      ];
    in
    {
      homeConfigurations."alizaidi" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit overlays system;
          config.allowUnfree = true;
        };
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
