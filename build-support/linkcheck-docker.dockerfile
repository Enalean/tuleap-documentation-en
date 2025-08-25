FROM nixos/nix:2.31.0@sha256:0e6ade350a4d86d76dd4046a654ccbbb58d14fe93b6e3deef42c1d0fd9db3849

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
