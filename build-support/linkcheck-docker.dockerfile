FROM nixos/nix:2.26.0@sha256:81a91bb176fa425c082033908e05012213aefc7aa1701056c872fb683cd7e933

COPY build-support/*.nix /build-support/
COPY pyproject.toml poetry.lock /

RUN nix-env -i -f build-support/build-tools.nix
