{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/6c6409e965a6c883677be7b9d87a95fab6c3472e.tar.gz";
    sha256 = "0l1py0rs1940wx76gpg66wn1kgq2rv2m9hzrhq5isz42hdpf4q6r";
  } ) {};
in pinnedNixpkgs
