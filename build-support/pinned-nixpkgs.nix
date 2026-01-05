{ }:

let
  pinnedNixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/c04833a1e584401bb63c1a63ddc51a71e6aa457a.tar.gz";
    sha256 = "sha256-knFaYjeg7swqG1dljj1hOxfg39zrIy8pfGuicjm9s+o=";
  }) { };
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/2c8df1383b32e5443c921f61224b198a2282a657.tar.gz";
    sha256 = "sha256-xaKvtPx6YAnA3HQVp5LwyYG1MaN4LLehpQI8xEdBvBY=";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/uv2nix/archive/7a3eb140416318349ec58d2d4e81afe071bc9f03.tar.gz";
        sha256 = "sha256-xxuRsew0pedwptVnhfru01xbe+dDhI+OY1kCFDMxBUs=";
      })
      {
        lib = pinnedNixpkgs.lib;
        inherit pyproject-nix;
      };
  pyproject-build-systems =
    import
      (builtins.fetchTarball {
        url = "https://github.com/pyproject-nix/build-system-pkgs/archive/042904167604c681a090c07eb6967b4dd4dae88c.tar.gz";
        sha256 = "sha256-4bocaOyLa3AfiS8KrWjZQYu+IAta05u3gYZzZ6zXbT0=";
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
