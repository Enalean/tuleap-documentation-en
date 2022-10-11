{ pkgs ? (import ./pinned-nixpkgs.nix) { } }:
[
  pkgs.gnumake
  pkgs.gnugrep
  pkgs.gnused
  pkgs.gawk
  (pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ../.;
    # Some overrides are needed because some packages does not define their build deps correctly
    # or do not respect PEP 440 when defining the version
    overrides = pkgs.poetry2nix.overrides.withDefaults (
      self: super: {
        idna = super.idna.overrideAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ self.flit-core ];
          }
        );
        sphinx = super.sphinx.overrideAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ self.flit-core ];
          }
        );
        sphinx-autobuild = super.sphinx-autobuild.overrideAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ self.flit-core ];
          }
        );
        sphinx-notfound-page = super.sphinx-notfound-page.overrideAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ self.flit-core ];
          }
        );
        sphinxext-rediraffe = super.sphinxext-rediraffe.overrideAttrs (
          old: {
            postPatch = ''
              substituteInPlace setup.py --replace 'version = "main"' 'version = "${old.version}"'
            '';
          }
        );
      }
    );
  })
]
