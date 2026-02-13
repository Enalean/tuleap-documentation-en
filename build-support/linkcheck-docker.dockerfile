FROM nixos/nix:2.33.3@sha256:37eafc36261a1efaf9b17f3e0cfb450be00893087e3797bd1e3be4df68dfe6fe

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
