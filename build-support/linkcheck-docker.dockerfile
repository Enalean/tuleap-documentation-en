FROM nixos/nix:2.26.3@sha256:cf7393e408da5ad343dad43670be72d7ee062b2a6a687990e9613ef9dc8bf2f6

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
