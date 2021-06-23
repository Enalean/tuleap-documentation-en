FROM nixos/nix:2.3.12 AS builder

RUN addgroup -S builder && adduser -S -G builder builder

COPY --chown=builder:builder . /home/builder/tuleap-documentation

RUN nix-env --install -f /home/builder/tuleap-documentation/default.nix

USER builder

WORKDIR /home/builder/tuleap-documentation

RUN npm ci && npm run build && \
    tmp_venv="$(mktemp -d)" && virtualenv "$tmp_venv" && \
    source "$tmp_venv"/bin/activate && \
    pip install -r requirements.txt && \
    make SPHINXOPTS="-D html_theme=tuleap_org" html

FROM nginx:1.21.0-alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
