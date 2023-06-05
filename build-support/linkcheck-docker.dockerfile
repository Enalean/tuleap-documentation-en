FROM nixos/nix:2.16.0@sha256:adcc2240c374ed91657bb128da8b256f2c4708473f11956d73ad9605fe93c8f4

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
