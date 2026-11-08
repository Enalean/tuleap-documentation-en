FROM nixos/nix:2.35.5@sha256:9305de534abed691d0f569502a4962a3a072ea8e888502c453ecfe35ae182867

COPY pyproject.toml uv.lock /doc/
COPY build-support/*.nix /doc/build-support/

RUN nix-env -i -f /doc/build-support/build-tools.nix
