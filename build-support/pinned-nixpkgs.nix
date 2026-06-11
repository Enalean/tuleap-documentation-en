{ }:

let
  pinnedNixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/8c3cede7ddc26bd659d2d383b5610efbd2c7a16e.tar.gz";
    sha256 = "sha256-rppURzHviaQN131F+nLiLdGfcb0uCd9gGP0E5+iw9MI=";
  }) { };
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/ad83f1ead0e78e57b188f35cb57298affb06fc5f.tar.gz";
    sha256 = "sha256-rRK3IFixgsrK6S3e14Xz9HAZm7+kMAIl3oi5zZlcwYI=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/uv2nix/archive/0497ccef038da091002be7c05263a7f27820974f.tar.gz";
        sha256 = "sha256-yZVQNvmDx1SFjvlwevywsXWJnieSRqmQr7/fCTMyyd0=";
      })
      {
        lib = pinnedNixpkgs.lib;
        inherit pyproject-nix;
      };
  pyproject-build-systems =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/build-system-pkgs/archive/7bff980f37fc24e09dbc986643719900c139bf12.tar.gz";
        sha256 = "sha256-MbXylBTkWqVm8/VYjoULtMoVRgWBN1gSHbeRKsOsPlU=";
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
