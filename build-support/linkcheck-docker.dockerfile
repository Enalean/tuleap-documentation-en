FROM nixos/nix:2.22.1@sha256:a53abaf5242b3e94ad0adce074c386d62eeeb73ec8571ffa28b1ba3f0b2576c9

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
