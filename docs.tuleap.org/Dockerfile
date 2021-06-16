FROM alpine:3.13.5 AS builder

RUN apk add --no-cache git make python3 py-virtualenv nodejs npm

RUN addgroup -S builder && adduser -S -G builder builder

USER builder

COPY --chown=builder:builder . /home/builder/tuleap-documentation

WORKDIR /home/builder/tuleap-documentation

RUN npm ci && npm run build && \
    tmp_venv="$(mktemp -d)" && virtualenv "$tmp_venv" && \
    source "$tmp_venv"/bin/activate && \
    pip install -r requirements.txt && \
    make SPHINXOPTS="-D html_theme=tuleap_org" html

FROM nginx:alpine

COPY docs.tuleap.org/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /home/builder/tuleap-documentation/_build/html/en/ /usr/share/nginx/html
