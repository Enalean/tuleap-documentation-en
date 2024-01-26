FROM nixos/nix:2.19.3@sha256:498fa2d7f2b5cb3891a4edf20f3a8f8496e70865099ba72540494cd3e2942634

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
