FROM nixos/nix:2.26.1@sha256:42d51ae5882b7d9a6ad3237d356025445dc75903b1bfe4eb007a3426356e6c42

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
