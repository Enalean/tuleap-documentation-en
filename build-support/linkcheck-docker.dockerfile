FROM nixos/nix:2.26.2@sha256:3bb728719e2c4e478df4c50b80f93adbe27d5c561d1417c3a2306eb914d910da

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
