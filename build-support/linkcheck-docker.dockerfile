FROM nixos/nix:2.28.2@sha256:51b15336cdd00cce3608ec31eb06852a82dfc4e85429011081a2b60f7d82f055

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
