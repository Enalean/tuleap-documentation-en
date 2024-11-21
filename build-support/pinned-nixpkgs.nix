{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/5083ec887760adfe12af64830a66807423a859a7.tar.gz";
    sha256 = "sha256-D1FNZ70NmQEwNxpSSdTXCSklBH1z2isPR84J6DQrJGs=";
  } ) {};
  poetry2nixsrc = builtins.fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/refs/tags/2024.11.109713.tar.gz";
    sha256 = "sha256:04nvlp0lp2kxycdywq0avzxpvyj69iij8xvl6havjmpm26dpbcqp";
  };
  poetry2nix = import poetry2nixsrc {
    pkgs = pinnedNixpkgs;
  };
in pinnedNixpkgs // { inherit poetry2nix; }
