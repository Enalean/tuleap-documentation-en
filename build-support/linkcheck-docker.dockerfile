FROM nixos/nix:2.11.1@sha256:d8c6b97091d6944dd773c3c239899af047077dbf5411ef229bb50e5b21404b0d

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
