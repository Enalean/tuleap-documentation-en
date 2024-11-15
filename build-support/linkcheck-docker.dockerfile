FROM nixos/nix:2.25.2@sha256:133a1607deea14a02c2bc0850e275ed135814235a1147f68967afee261caea2b

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
