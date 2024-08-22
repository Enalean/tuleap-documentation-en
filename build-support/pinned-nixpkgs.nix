{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/d13fa5a45a34e7c8be33474f58003914430bdc5a.tar.gz";
    sha256 = "sha256-G7Mf9uN9m8FimeP3eMHu/dOC4QS8QAzo0h4ZIlDHcCA=";
  } ) {};
  poetry2nixsrc = builtins.fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/refs/tags/2024.8.2111184.tar.gz";
    sha256 = "sha256:0p68vkp01r8wmq169sklagvkjyyvddlrc0mrnwzhr04zyh85q92c";
  };
  poetry2nix = import poetry2nixsrc {
    pkgs = pinnedNixpkgs;
  };
in pinnedNixpkgs // { inherit poetry2nix; }
