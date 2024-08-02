FROM nixos/nix:2.24.1@sha256:35eceeb5912fbb3d70f0e7279e06b1aeb087236eddcfa89ca2136e4a16e58a50

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
