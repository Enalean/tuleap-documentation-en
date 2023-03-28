FROM nixos/nix:2.15.0pre20230327_2523448@sha256:1a8e7b9869ec5bca243f138d5e12a8414b154f84a8c26b8440ebc4fbf0d160a3 AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --pure --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_org" html'

FROM nginx:1.23.3-alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
