FROM nixos/nix:2.7.0 AS builder

COPY --chown=1000:1000 . /home/builder/tuleap-documentation

RUN nix-env --install -f /home/builder/tuleap-documentation/default.nix && chmod 0777 /tmp

USER 1000:1000

WORKDIR /home/builder/tuleap-documentation

RUN HOME=/tmp npm ci && npm run build && \
    tmp_venv="$(mktemp -d)" && virtualenv "$tmp_venv" && \
    source "$tmp_venv"/bin/activate && \
    pip install -r requirements.txt && \
    make SPHINXOPTS="-D html_theme=tuleap_org" html

FROM nginx:1.21.6-alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
