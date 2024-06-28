FROM nixos/nix:2.23.1@sha256:8dc1be8f33165dbc3f8fa26822925b225af471366e1b2958835cc01d316bf773 AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_org" html'

FROM nginx:1.27.0-alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
