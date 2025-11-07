FROM nixos/nix:2.32.3@sha256:579d934720bf27ff15bf17ada6fe5d8dd7c977aa0d60ddbe9e54ac591842a728

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
