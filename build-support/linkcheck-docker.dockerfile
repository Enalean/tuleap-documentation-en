FROM nixos/nix:2.23.2@sha256:14b8b20d37d69729582d98b7091714a0cf970eabfc0cc5aad35fe83229a10dde

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
