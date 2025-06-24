FROM nixos/nix:2.29.1@sha256:2c8d8095d21720e64d025661caca856118505d17964e39cb7b9c49faed57defd

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
