FROM nixos/nix:2.26.3@sha256:cf7393e408da5ad343dad43670be72d7ee062b2a6a687990e9613ef9dc8bf2f6

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
