FROM nixos/nix:2.20.2@sha256:f87deb3da78ecbd211765bc2aa24278612603e0a9731732dcb3932896f06e422

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
