FROM nixos/nix:2.33.1@sha256:d5cce2440bda1f966357732c06d86cb92368069fb52dfb6b2bae8725eea488a5

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
