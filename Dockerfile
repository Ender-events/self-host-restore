FROM alpine:3.13.2

RUN apk add --no-cache restic postgresql-client

COPY restore.sh /opt/restore.sh

CMD ["/opt/restore.sh"]
