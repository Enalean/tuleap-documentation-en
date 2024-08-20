FROM nixos/nix:2.24.3@sha256:552b0a2f097ac72a148c28a4ed40760bbc4054760881fdd7709f5f7c5c88e48f

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
