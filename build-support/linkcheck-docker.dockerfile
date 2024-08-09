FROM nixos/nix:2.24.2@sha256:db38bc7ae48fc71702c845dfe1952922224039bba1aa9f82567761c5b5441e58

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
