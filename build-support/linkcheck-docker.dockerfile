FROM nixos/nix:2.24.4@sha256:338ca39c0c75f10919cd0cf38647ce4543033d2bbdabab4519de5adee45445f8

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
