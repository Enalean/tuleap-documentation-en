FROM nixos/nix:2.17.0@sha256:a186d0501304e87751280b7b6ad62b54b9d08b8c5c63b9752eac408e1159c340

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
