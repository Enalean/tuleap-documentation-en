FROM nixos/nix:2.34.6@sha256:e2fe74e96e965653c7b8f16ac64d1e56581c63c84d7fa07fb0692fd055cd06b0 AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN nix-shell --run 'npm ci && npm run build && make SPHINXOPTS="-D html_theme=tuleap_online_doc" html'

FROM nginx:1.30.0-alpine

COPY online-docs/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
