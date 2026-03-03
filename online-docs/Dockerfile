FROM nixos/nix:2.34.0@sha256:b9c9611c8530fa8049a1215b20638536e1e71dcaf85212e47845112caf3adeea AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_online_doc" html'

FROM nginx:1.29.5-alpine

COPY online-docs/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
