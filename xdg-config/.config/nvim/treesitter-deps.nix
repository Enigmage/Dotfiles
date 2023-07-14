# Treesitter parsers installation is messed up normally
# this ensures smooth installation by providing the environment
# just run nix-shell treesitter-deps.nix --command 'nvim'
{ pkgs ? import <nixpkgs> {}}:

with pkgs;
pkgs.mkShell {
    buildInputs = [
        gcc
        nodejs
        neovim
        tree-sitter
        python311Packages.pynvim
    ];
}
