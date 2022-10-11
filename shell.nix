{ pkgs ? (import ./build-support/pinned-nixpkgs.nix) {} }:

pkgs.mkShellNoCC {
  buildInputs = [
    (import ./build-support/build-tools.nix { inherit pkgs; })
    (import ./build-support/dev-tools.nix { inherit pkgs; })
  ];
}
