FROM nixos/nix:2.33.3@sha256:c2f7db70a432d00c6759af108ff4fbc74a4c00e2d4517162e72338e7b9449c1f AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_online_doc" html'

FROM nginx:1.29.5-alpine

COPY online-docs/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
