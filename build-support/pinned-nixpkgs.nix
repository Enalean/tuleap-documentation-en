{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/280db3decab4cbeb22a4599bd472229ab74d25e1.tar.gz";
    sha256 = "sha256-Jks8O42La+nm5AMTSq/PvM5O+fUAhIy0Ce1QYqLkyZ4=";
  } ) {};
  poetry2nixsrc = builtins.fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/refs/tags/2024.9.538703.tar.gz";
    sha256 = "sha256:1z9x77kx9ggrvnj7z62c2vyj3cnwzwlzhghcq4ffk9ph030xl9vl";
  };
  poetry2nix = import poetry2nixsrc {
    pkgs = pinnedNixpkgs;
  };
in pinnedNixpkgs // { inherit poetry2nix; }
