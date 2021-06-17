{ pkgs ? (import ./pinned-nixpkgs.nix) {} }:

pkgs.mkShell {
  buildInputs = [
    (import ./default.nix { inherit pkgs; })
  ];
}
