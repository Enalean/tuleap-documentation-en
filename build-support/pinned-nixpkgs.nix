{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/f945939fd679284d736112d3d5410eb867f3b31c.tar.gz";
    sha256 = "06da1wf4w752spsm16kkckfhxx5m09lwcs8931gwh76yvclq7257";
  } ) {};
  poetry2nixsrc = builtins.fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/refs/tags/2024.2.2230616.tar.gz";
    sha256 = "0qx2iv57vhgraaqj4dm9zd3dha1p6ch4n07pja0hsxsymjbvdanw";
  };
  poetry2nix = import poetry2nixsrc {
    pkgs = pinnedNixpkgs;
  };
in pinnedNixpkgs // { inherit poetry2nix; }
