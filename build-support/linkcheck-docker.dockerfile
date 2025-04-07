FROM nixos/nix:2.28.1@sha256:44ececd2206e68b5f3ebf6d642b978559f74fc7edae3f2809baa555d669157c1

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
