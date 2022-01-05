{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/1dd151f0c0c216f416e9553af08f724a2499c795.tar.gz";
    sha256 = "14d9c178rx2q3q8x5pwa7ga9sgwm49gidlrhka8886l1mgiqba7a";
  } ) {};
in pinnedNixpkgs
