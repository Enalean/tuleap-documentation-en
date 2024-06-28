FROM nixos/nix:2.23.1@sha256:8dc1be8f33165dbc3f8fa26822925b225af471366e1b2958835cc01d316bf773

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
