FROM nixos/nix:2.24.6@sha256:95ce012fbc5e3af2e8f6bf93dddbf3f438c682056dbcf9c2ce71a7b1e9a77960

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
