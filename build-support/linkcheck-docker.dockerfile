FROM nixos/nix:2.24.5@sha256:4ad79a0ab633944869a37921f096d35a3f2c7a0275d98b7bfa0cd3cba5a6b96e

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
