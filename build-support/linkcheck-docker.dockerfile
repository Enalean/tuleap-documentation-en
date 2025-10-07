FROM nixos/nix:2.32.0@sha256:a3b5d472ca187c25c87a217bc730cdf7a3df7d07ee09eb37f5bc8c874f173a52

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
