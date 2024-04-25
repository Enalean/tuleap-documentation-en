FROM nixos/nix:2.22.0@sha256:6913f4e5e2f8c10d6f3bbbe426b821347881d160476e7d58a1e4c7c7c3a851e2

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
