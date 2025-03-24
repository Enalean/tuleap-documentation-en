FROM nixos/nix:2.27.1@sha256:cf7ba2afcacd7be9171259d209d2d1ae6ab183b5c561c7e7524a9bc1d8fddaa1

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
