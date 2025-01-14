FROM nixos/nix:2.25.4@sha256:a1b55331f991ff7c6706943d3fe4362356d4c29c2ad2b507aad86723fa579d29

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
