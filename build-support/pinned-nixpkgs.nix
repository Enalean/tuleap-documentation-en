{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/199169a2135e6b864a888e89a2ace345703c025d.tar.gz";
    sha256 = "sha256-igS2Z4tVw5W/x3lCZeeadt0vcU9fxtetZ/RyrqsCRQ0=";
  } ) {};
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/7747e5a058245c7abe033a798f818f0572d8e155.tar.gz";
    sha256 = "sha256:1hcw8b2kyx27ajam28sm2c707pfvxs9xqq30386sv6x0404ij0cd";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/uv2nix/archive/0525f1e0e566734ab6eaca589b3e5cb9186d9d46.tar.gz";
    sha256 = "sha256:0ppgvjva3fdrn676rn31qbnylnn0acmfw75z4qci18v417gif67c";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix; };
  pyproject-build-systems = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/build-system-pkgs/archive/6d7eced86469cf89ed4d19d91b870163deb0dca2.tar.gz";
    sha256 = "sha256:0hxz2xjjv5pbz8lyfij89214q4s64lz7q1fpvlvd26fcbbdj7w6b";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix uv2nix; };
in pinnedNixpkgs // { inherit pyproject-nix uv2nix pyproject-build-systems; }
