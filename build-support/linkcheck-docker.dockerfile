FROM nixos/nix:2.20.0@sha256:e3b7c652fb710a9c4a4db0c8a2653b73331dd8dba8e9990b20574236cfc82018

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
