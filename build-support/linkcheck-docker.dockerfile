FROM nixos/nix:2.20.5@sha256:114b96fb3594cd0868fcad7e7ee0322e7fae11b7e6e2f3506a1fd6447eeb2cd5

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
