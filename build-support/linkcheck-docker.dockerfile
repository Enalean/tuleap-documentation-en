FROM nixos/nix:2.24.8@sha256:6ee0f137bee58b60af090b1894dc2bae170ec063240ed3c6d8d4da94f73c4086

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
