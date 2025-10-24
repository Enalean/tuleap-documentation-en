{
  pkgs ? (import ./build-support/pinned-nixpkgs.nix) { },
}:

pkgs.mkShellNoCC {
  UV_NO_SYNC = "1";
  UV_PYTHON_DOWNLOADS = "never";
  UV_PYTHON = pkgs.lib.getExe pkgs.python3;

  buildInputs = [
    (import ./build-support/build-tools.nix { inherit pkgs; })
    (import ./build-support/dev-tools.nix { inherit pkgs; })
  ];
}
