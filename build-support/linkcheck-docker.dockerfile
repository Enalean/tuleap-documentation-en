FROM nixos/nix:2.19.1@sha256:7f3219ae39fb6ded5ec8846cf905859c83ab6c2a9879aa0de430bc35c7377f4e

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
