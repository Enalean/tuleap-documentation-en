FROM nixos/nix:2.24.7@sha256:b468b493a830d5dea9e6cd67d0c38bd4b37675eca92ead0c84d774d2ab33c63a

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
