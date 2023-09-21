FROM nixos/nix:2.18.0@sha256:ea010add01de314c23def4f333c2881ac5dda92031aaf5260a4d9491af401179

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
