{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/1e1dc66fe68972a76679644a5577828b6a7e8be4.tar.gz";
    sha256 = "1nmra8aiiazi0w19x4cbb3qzy3l6ff9yaki3pkibhwh2grm88132";
  } ) {};
  poetry2nixsrc = builtins.fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/refs/tags/2024.2.2230616.tar.gz";
    sha256 = "0qx2iv57vhgraaqj4dm9zd3dha1p6ch4n07pja0hsxsymjbvdanw";
  };
  poetry2nix = import poetry2nixsrc {
    pkgs = pinnedNixpkgs;
  };
in pinnedNixpkgs // { inherit poetry2nix; }
