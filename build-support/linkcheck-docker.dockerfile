FROM nixos/nix:2.23.3@sha256:5a2a7ee72e88528ff9422f16a8a0be580d8c173928369a20e8a6ba77a55cd95d

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
