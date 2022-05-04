{ pkgs ? (import ./pinned-nixpkgs.nix) {} }:
[
  pkgs.gnumake
  pkgs.gnugrep
  pkgs.gnused
  pkgs.gawk
  pkgs.python39Packages.virtualenv
  pkgs.nodejs-slim-18_x
  pkgs.nodePackages.npm
]
