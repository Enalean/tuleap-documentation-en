FROM nixos/nix:2.15.0pre20230406_9185639@sha256:1c95fce0920583d11b86691cb1eeffac209bca7e9c00f236b26e2ba401207d54 AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --pure --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_org" html'

FROM nginx:1.23.4-alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
