FROM nixos/nix:2.22.0@sha256:d832e9b78fe119bdbe86549ab53557b27c837f3f02d1addc885ba294d143769b

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
