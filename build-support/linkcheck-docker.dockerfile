FROM nixos/nix:2.18.1@sha256:2fc678cf4a74145785d0eec1a41b2b25f2a092eb843e04f9606e91554c8c3ec5

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
