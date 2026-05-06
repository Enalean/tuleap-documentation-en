{ }:

let
  pinnedNixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/73c703c22422b8951895a960959dbbaca7296492.tar.gz";
    sha256 = "sha256-wQ/iN5Zp5VIa3ebBibijPnLyKhor+xEbDy4d0goa9Zs=";
  }) { };
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/69f57f27e52a87c54e28138a75ec741cd46663c9.tar.gz";
    sha256 = "sha256-Gs1VnEkCkkRZxJQAC/Dhz0Jbfi22mFXChbtNg9w/Ybg=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/uv2nix/archive/5ad90d48b80ecc920ca2247d53f46beba302e186.tar.gz";
        sha256 = "sha256-KebDsQd+A7pm++Tp0744EjULttHvz1wbKqNKkMA/088=";
      })
      {
        lib = pinnedNixpkgs.lib;
        inherit pyproject-nix;
      };
  pyproject-build-systems =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/build-system-pkgs/archive/ffaa2161dd5d63e0e94591f86b54fc239660fb2e.tar.gz";
        sha256 = "sha256-qapCOQmR++yZSY43dzrp3wCrkOTLpod+ONtJWBk6iKU=";
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
