FROM nixos/nix:2.33.2@sha256:c6ebd12d96b3374ee15e3986c15aa43f5e49310634f17afcaaf4dafe4f6732b2

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
