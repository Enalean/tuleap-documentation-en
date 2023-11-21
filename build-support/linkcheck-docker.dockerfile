FROM nixos/nix:2.19.0@sha256:64942196a1c64fef65ec594557ddc4c46c143d23fa6492ab6cf4a89443bf47e0

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
