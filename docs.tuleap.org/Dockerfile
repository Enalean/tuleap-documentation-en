FROM nixos/nix:2.25.4@sha256:a1b55331f991ff7c6706943d3fe4362356d4c29c2ad2b507aad86723fa579d29 AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_org" html'

FROM nginx:1.27.3-alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
