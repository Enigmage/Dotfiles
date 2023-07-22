# Treesitter parsers installation is messed up normally
# this ensures smooth installation by providing the environment
# just run nix-shell treesitter-deps.nix --command 'nvim' then :TSInstall all
{ pkgs ? import (fetchTarball
"https://github.com/NixOS/nixpkgs/archive/53657afe29748b3e462f1f892287b7e254c26d77.tar.gz") {}
}:

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
