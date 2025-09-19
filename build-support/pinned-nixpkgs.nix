{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/124b966f89fad5468ca67ac7ee15af4ecce49b47.tar.gz";
    sha256 = "sha256-rPOgMmyyO1V66GbDXOcKje2AtdpWFLqSv8GAUvKH9wY=";
  } ) {};
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/02e9418fd4af638447dca4b17b1280da95527fc9.tar.gz";
    sha256 = "sha256-amLaLNwKSZPShQHzfgmc/9o76dU8xzN0743dWgvYlr8=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/uv2nix/archive/656928e823e305426200f478a887943a600db303.tar.gz";
    sha256 = "sha256-9G0Yo7TXFJEfSyHNrbV1WNEKhEojqQ3J0aWd0aYpixs=";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix; };
  pyproject-build-systems = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/build-system-pkgs/archive/5b8e37fe0077db5c1df3a5ee90a651345f085d38.tar.gz";
    sha256 = "sha256-6nzSZl28IwH2Vx8YSmd3t6TREHpDbKlDPK+dq1LKIZQ=";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix uv2nix; };
in pinnedNixpkgs // { inherit pyproject-nix uv2nix; pyproject-build-systems = pyproject-build-systems.default; }
