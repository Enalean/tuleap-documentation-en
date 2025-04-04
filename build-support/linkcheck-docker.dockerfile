FROM nixos/nix:2.28.0@sha256:73e0ac9036824e605365b3fe5d1eb23725c309043856135a51496dc4c311fbde

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
