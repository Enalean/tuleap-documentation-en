FROM nixos/nix:2.34.3@sha256:22c0a3a816eb3d315eb6720d2a58a3c3b622c9717c578f3c80b687668c6da277 AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_online_doc" html'

FROM nginx:1.29.6-alpine

COPY online-docs/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
