FROM nixos/nix:2.32.1@sha256:321bc7ebbbe17b68fd21ed162d096c058f55e209359286330f6e793cafab228e

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
