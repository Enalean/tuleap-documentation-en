FROM nixos/nix:2.25.3@sha256:5a0d942e11cf154230289c4bca0cb391c44ed8e83561f3f8f2ef708bc0edda93

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
