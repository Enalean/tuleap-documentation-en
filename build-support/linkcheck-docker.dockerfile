FROM nixos/nix:2.19.2@sha256:935cdafedba76f86c45d01f30f243474c958e1099029b292e5f2fbeac5f8805e

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
