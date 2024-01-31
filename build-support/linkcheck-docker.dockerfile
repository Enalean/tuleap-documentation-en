FROM nixos/nix:2.20.1@sha256:ab7306ccfa8168ad63f4e91a6217a73decdd641c49c7274212a93df19ee88938

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
