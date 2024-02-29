FROM nixos/nix:2.20.4@sha256:6894c0facc8f8c10cac72d47e1463d6a4bc9a02f2ee766014b717c294043689c

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
