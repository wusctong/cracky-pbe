FROM alpine:latest

RUN apk add --no-cache bash ca-certificates

COPY gate /usr/local/bin/gate
COPY config.template.yml /app/config.template.yml
COPY start.sh /app/start.sh
RUN chmod +x /usr/local/bin/gate /app/start.sh

WORKDIR /app
ENV PATH="/usr/local/bin:${PATH}"

CMD ["/app/start.sh"]
