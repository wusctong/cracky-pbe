# 第一阶段：构建 gate
FROM golang:1.21-alpine AS builder
RUN apk add --no-cache git bash
WORKDIR /app
ENV GO111MODULE=on
RUN go install go.minekube.com/gate@latest

# 第二阶段：运行阶段
FROM alpine:latest
RUN apk add --no-cache bash ca-certificates
WORKDIR /app
COPY --from=builder /go/bin/gate /usr/local/bin/gate
ENV PORT=8080
CMD ["sh", "-c", "gate --ws.bind :${PORT} --lite.default_backend mc.hypixel.net:25565"]

