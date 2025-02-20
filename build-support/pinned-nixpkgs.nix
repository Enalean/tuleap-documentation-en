{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/2d55b4c1531187926c2a423f6940b3b1301399b5.tar.gz";
    sha256 = "sha256-NCWZQg4DbYVFWg+MOFrxWRaVsLA7yvRWAf6o0xPR1hI=";
  } ) {};
  poetry2nixsrc = builtins.fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/refs/tags/2025.2.1847502.tar.gz";
    sha256 = "sha256:0yfg51z8giwapc4kxxcrh47xr0zppwxiwaj7iyy6qsfd3a9649yz";
  };
  poetry2nix = import poetry2nixsrc {
    pkgs = pinnedNixpkgs;
  };
in pinnedNixpkgs // { inherit poetry2nix; }
