FROM nixos/nix:2.13.3@sha256:1f8fa57de6f2f9ea5ea8d115b339fa68d2f98f20b59438bdb9d3a082ad64d4bf AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --pure --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_org" html'

FROM nginx:1.23.3-alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
