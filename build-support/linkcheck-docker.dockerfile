FROM nixos/nix:2.23.0@sha256:7ac2cd9079e1bdfdae8af24b0887fdcaaf0f9c30c1afe2b26bcbf24e2fd4a4e7

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
