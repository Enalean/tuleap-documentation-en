{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/38d3352a65ac9d621b0cd3074d3bef27199ff78f.tar.gz";
    sha256 = "0cww7hyrdh5mylk2rb0v9i7iic0gy5qnn9sa7bz3rmnwwgjwys56";
  } ) {};
  poetry2nixsrc = builtins.fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/refs/tags/2024.6.2040715.tar.gz";
    sha256 = "0n7lm77sxy8b40rfc400h4hg8b8ds0n11cmg1pxdr9hi4m5d2hk5";
  };
  poetry2nix = import poetry2nixsrc {
    pkgs = pinnedNixpkgs;
  };
in pinnedNixpkgs // { inherit poetry2nix; }
