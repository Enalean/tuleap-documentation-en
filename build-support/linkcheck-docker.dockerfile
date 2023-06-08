FROM nixos/nix:2.16.1@sha256:f41a29be267750fdbbeb3d46c5b8899149ac92fb390cee74ab7c0a2487dce5b2

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
