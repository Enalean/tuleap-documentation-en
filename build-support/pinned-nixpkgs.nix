{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/29335f23bea5e34228349ea739f31ee79e267b88.tar.gz";
    sha256 = "sha256-v/sK3AS0QKu/Tu5sHIfddiEHCvrbNYPv8X10Fpux68g=";
  } ) {};
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/2db2d95ddbc4ff5e29730cb82fdba6647be258a7.tar.gz";
    sha256 = "sha256:0wra289b7dfphbwjrb1rcqy0pk6qnshicdy6flmwq3cm0g3amybk";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/uv2nix/archive/6d19baf0fcc7a013ae9c1c188bbf7cfe37b566e0.tar.gz";
    sha256 = "sha256:19xab74w74zhymhr1rh0pk2q8lppvjhj5yfil3yz86jr4w2d9pxy";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix; };
  pyproject-build-systems = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/build-system-pkgs/archive/6d7eced86469cf89ed4d19d91b870163deb0dca2.tar.gz";
    sha256 = "sha256:0hxz2xjjv5pbz8lyfij89214q4s64lz7q1fpvlvd26fcbbdj7w6b";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix uv2nix; };
in pinnedNixpkgs // { inherit pyproject-nix uv2nix pyproject-build-systems; }
