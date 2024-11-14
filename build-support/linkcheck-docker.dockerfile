FROM nixos/nix:2.25.1@sha256:00f802fa6916770dd78fd38b5c450582fe8c213d157bcc7ce8db14922615a43f

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
