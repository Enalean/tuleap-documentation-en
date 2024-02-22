FROM nixos/nix:2.20.3@sha256:273671b9032d06844ec073affa9fb1e75bf7ad863975bec5143e7fa417929fb8

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
