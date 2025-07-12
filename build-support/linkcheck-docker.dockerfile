FROM nixos/nix:2.30.1@sha256:8c144c6c37184fe03fd7fed740c6eeb2ecfd801d6e34a6aba4e38f1c8d10de3e

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
