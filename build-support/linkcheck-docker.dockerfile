FROM nixos/nix:2.34.5@sha256:4e211f6763c542b08e9cdba448381286a3638903359390b46eab5f43ce6a6ed1

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
