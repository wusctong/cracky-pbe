# 第一阶段：构建 Gate
FROM golang:1.21-alpine AS builder
RUN apk add --no-cache git bash
WORKDIR /app
ENV GO111MODULE=on
RUN go install go.minekube.com/gate@latest

# 第二阶段：轻量运行镜像
FROM alpine:latest
RUN apk add --no-cache bash ca-certificates
COPY --from=builder /go/bin/gate /usr/local/bin/gate
WORKDIR /app
CMD sh -c "gate --ws.bind :$PORT --lite.default_backend mc.hypixel.net:25565"
