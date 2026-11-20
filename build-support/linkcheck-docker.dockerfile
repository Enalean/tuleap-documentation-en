FROM nixos/nix:2.36.0@sha256:746280551ddc1c72177d1a597c05eacac86dfaa18d5d649bf86411278bcd5470

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
