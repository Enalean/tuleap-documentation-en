{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/870dbb751f4d851a3dfb554835a0c2f528386982.tar.gz") {} }:

pkgs.stdenv.mkDerivation {
    name = "tuleap-documentation-en-build";
    buildInputs = [
        pkgs.gnumake
        pkgs.gnugrep
        pkgs.gnused
        pkgs.gawk
        pkgs.python39Packages.virtualenv
        pkgs.nodejs-slim-14_x
        pkgs.nodePackages.npm
    ];
}
