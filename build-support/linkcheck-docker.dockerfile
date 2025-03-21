FROM nixos/nix:2.27.0@sha256:616714531c80cc71a12974eed2db8ebb0f7b74fc58b89013c6c680f32ebb4078

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
