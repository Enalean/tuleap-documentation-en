FROM nixos/nix:2.31.1@sha256:24196c350d146529a4101edea9c82129308640b500ebbc01d225ad36b6322cb6

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
