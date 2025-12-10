FROM nixos/nix:2.33.0@sha256:081b65e50a5c4e6ef4a9094a462da3b83ff76bfec70236eb010047fcee36e11c

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
