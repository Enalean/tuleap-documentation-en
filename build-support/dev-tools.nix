{
  pkgs,
  treefmt-nix ? (import ./pinned-treefmt-nix.nix { }),
}:
[
  pkgs.uv
  pkgs.nodejs-slim
  pkgs.nodePackages.npm
  (treefmt-nix.mkWrapper pkgs {
    programs.oxipng.enable = true;
    programs.nixfmt = {
      enable = true;
      package = pkgs.nixfmt;
    };
  })
]
