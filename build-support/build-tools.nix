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
    # https://github.com/nix-community/poetry2nix/blob/master/docs/edgecases.md
    overrides = pkgs.poetry2nix.defaultPoetryOverrides.extend (
      self: super: {
        sphinx = super.sphinx.overridePythonAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ self.flit-core ];
          }
        );
        sphinx-autobuild = super.sphinx-autobuild.overridePythonAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ self.flit-core ];
          }
        );
        sphinx-notfound-page = super.sphinx-notfound-page.overridePythonAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ self.flit-core ];
          }
        );
        sphinxext-rediraffe = super.sphinxext-rediraffe.overridePythonAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
            postPatch = ''
              substituteInPlace setup.py --replace 'version = "main"' 'version = "${old.version}"'
            '';
          }
        );
        sphinxcontrib-mermaid = super.sphinxcontrib-mermaid.overridePythonAttrs (
          old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools ];
          }
        );
      }
    );
  })
]
