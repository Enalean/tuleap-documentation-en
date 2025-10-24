{ }:

let
  pinnedNixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/cb82756ecc37fa623f8cf3e88854f9bf7f64af93.tar.gz";
    sha256 = "sha256-0JDOal5P7xzzAibvD0yTE3ptyvoVOAL0rcELmDdtSKg=";
  }) { };
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/84c4ea102127c77058ea1ed7be7300261fafc7d2.tar.gz";
    sha256 = "sha256-jF6UKLs2uGc2rtved8Vrt58oTWjTQoAssuYs/0578Z4=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/uv2nix/archive/e6e728d9719e989c93e65145fe3f9e0c65a021a2.tar.gz";
        sha256 = "sha256-4Kt3RsfJgg6HzmDCc44ZN//xB8n7KGEGxxt9dNjqPQc=";
      })
      {
        lib = pinnedNixpkgs.lib;
        inherit pyproject-nix;
      };
  pyproject-build-systems =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/build-system-pkgs/archive/dbfc0483b5952c6b86e36f8b3afeb9dde30ea4b5.tar.gz";
        sha256 = "sha256-fgxP2RCN4cg0jYiMYoETYc7TZ2JjgyvJa2y9l8oSUFE=";
      })
      {
        lib = pinnedNixpkgs.lib;
        inherit pyproject-nix uv2nix;
      };
in
pinnedNixpkgs
// {
  inherit pyproject-nix uv2nix;
  pyproject-build-systems = pyproject-build-systems.default;
}
