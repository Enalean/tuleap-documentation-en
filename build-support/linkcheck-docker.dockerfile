FROM nixos/nix:2.24.10@sha256:a09d508c2e46d3a4c7205ff3fa0d506d626a5a966c31e879df7efe737e22f003

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
