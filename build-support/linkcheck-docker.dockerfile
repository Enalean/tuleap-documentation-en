FROM nixos/nix:2.30.0@sha256:87b2b0ddd5ba3f8a87e3d7d5cf37ed53f965c52373e578f9c137ba010a41723f

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
