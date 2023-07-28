{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/af8cd5ded7735ca1df1a1174864daab75feeb64a.tar.gz";
    sha256 = "0a81s3n25l2rk86gp2yxpnxv8a33cknml8z2snfzcsjp0g1a0xr3";
  } ) {};
in pinnedNixpkgs
