FROM nixos/nix:2.21.0@sha256:6a5283d70ce72a32e434f151e35213065ae5108e07bff876182343c876cca075

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
