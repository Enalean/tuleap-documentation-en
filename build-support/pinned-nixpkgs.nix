{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/e44b8dc0882d66e2627a8ff252b04a22f4a629fd.tar.gz";
    sha256 = "sha256-w81jpZeM3AtYlTKIhT05p3IqvJRIHZPyp0Acgb6hXWc=";
  } ) {};
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/62cc4495b3b2d2a259db321a06584378e93843a6.tar.gz";
    sha256 = "sha256-r0NuyhyLUeLe/kSr+u2VFGjHFdccBJckZyFt74MYL5A=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/uv2nix/archive/656928e823e305426200f478a887943a600db303.tar.gz";
    sha256 = "sha256-9G0Yo7TXFJEfSyHNrbV1WNEKhEojqQ3J0aWd0aYpixs=";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix; };
  pyproject-build-systems = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/build-system-pkgs/archive/45888b7fd4bf36c57acc55f07917bdf49ec89ec9.tar.gz";
    sha256 = "sha256-H+gLv6424OjJSD+l1OU1ejxkN/v0U+yaoQdh2huCXYI=";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix uv2nix; };
in pinnedNixpkgs // { inherit pyproject-nix uv2nix; pyproject-build-systems = pyproject-build-systems.default; }
