{ pkgs ? (import ./pinned-nixpkgs.nix) {} }:

pkgs.mkShellNoCC {
  buildInputs = [
    (import ./default.nix { inherit pkgs; })
  ];
}
