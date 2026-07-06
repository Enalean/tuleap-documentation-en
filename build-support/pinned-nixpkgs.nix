{ }:

let
  pinnedNixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/7a1a64774a5fd0b0cd39ac95d0e170ace8b266a0.tar.gz";
    sha256 = "sha256-N66fYdUuZ9hpdM7jsQ7CUWtLJduqGDyTGCaLR62CXaQ=";
  }) { };
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/7af23cfe91064865ecf2e835da28b45b3c6f49fd.tar.gz";
    sha256 = "sha256-SvXJcAemihifkTn4BGvyE5K1FJX9bl4U8DQ5pqKvD0s=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/uv2nix/archive/288b0a580ede39d3d7f96e3d835f9df0a7080223.tar.gz";
        sha256 = "sha256-oseisp2tblvzYZdojkA5URLnMjrpPiemzr5T7BdUyuU=";
      })
      {
        lib = pinnedNixpkgs.lib;
        inherit pyproject-nix;
      };
  pyproject-build-systems =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/build-system-pkgs/archive/430680a19bc85a3bda55f12e4cc1a1aadcf2e478.tar.gz";
        sha256 = "sha256-6gmEVe69+KlRkZD4PEEV5xAlB9CB0Y9TiuEgQjDrKTQ=";
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
