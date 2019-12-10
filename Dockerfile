FROM alpine:3.10.3

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT docker-entrypoint.sh
