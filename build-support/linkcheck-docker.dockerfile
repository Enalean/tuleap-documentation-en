FROM nixos/nix:2.25.0@sha256:533c1160255c4ab12486c666a81aef6a380482e32a33a34c796392235679b568

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
