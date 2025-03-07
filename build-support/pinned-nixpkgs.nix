{}:

let
  pinnedNixpkgs = import (fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/5083ec887760adfe12af64830a66807423a859a7.tar.gz";
    sha256 = "sha256-D1FNZ70NmQEwNxpSSdTXCSklBH1z2isPR84J6DQrJGs=";
  } ) {};
  pyproject-nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/pyproject.nix/archive/1329712f7f9af3a8b270764ba338a455b7323811.tar.gz";
    sha256 = "sha256:1yvqfc6akbimflhgp5b6b4q57rmahgs96m81zbx7gv0299sbi1h2";
  }) { lib = pinnedNixpkgs.lib; };
  uv2nix = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/uv2nix/archive/846ad27167bf6a855c56753ba8360759bfb6f456.tar.gz";
    sha256 = "sha256:0ivbg4szn2p6xvjrm9qg9xh8nhd3p7lh88qln596f2kchvv4aysm";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix; };
  pyproject-build-systems = import (builtins.fetchTarball {
    url = "https://github.com/pyproject-nix/build-system-pkgs/archive/53700950d05fc2dd67228277ff1729964d2e7ffd.tar.gz";
    sha256 = "sha256:1aipbbwpidzyb4gxpgsc5fr7hiv2xy1zp3400rzzqqkjxd0vr0s8";
  }) { lib = pinnedNixpkgs.lib; inherit pyproject-nix uv2nix; };
in pinnedNixpkgs // { inherit pyproject-nix uv2nix pyproject-build-systems; }
