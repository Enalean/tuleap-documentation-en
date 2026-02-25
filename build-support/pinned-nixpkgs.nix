{ }:

let
  pinnedNixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/724cf38d99ba81fbb4a347081db93e2e3a9bc2ae.tar.gz";
    sha256 = "sha256-MpAKyXfJRDTgRU33Hja+G+3h9ywLAJJNRq4Pjbb4dQs=";
  }) { };
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/eb204c6b3335698dec6c7fc1da0ebc3c6df05937.tar.gz";
    sha256 = "sha256-nFJSfD89vWTu92KyuJWDoTQJuoDuddkJV3TlOl1cOic=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/uv2nix/archive/44d9a110d65fc4caaf9349fa819e8daf9d90d074.tar.gz";
        sha256 = "sha256-boRfTlN1GfVupWPnhcKlSHJzs9/lJP9KltycPLoPRbA=";
      })
      {
        lib = pinnedNixpkgs.lib;
        inherit pyproject-nix;
      };
  pyproject-build-systems =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/build-system-pkgs/archive/04e9c186e01f0830dad3739088070e4c551191a4.tar.gz";
        sha256 = "sha256-7uXPiWB0YQ4HNaAqRvVndYL34FEp1ZTwVQHgZmyMtC8=";
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
