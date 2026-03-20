FROM nixos/nix:2.34.2@sha256:cf42be9911411150ed246632633e846ee185384d97c9a8a27e8ca15ab3a7a48f

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
