FROM nixos/nix:2.34.1@sha256:1d59121e0c361076b4f23c158d236702f2f045b3b477b51075b81ceb6188d34a

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
