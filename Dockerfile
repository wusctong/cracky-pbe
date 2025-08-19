# 第一阶段：构建 Gate
FROM golang:1.21-alpine AS builder
RUN apk add --no-cache git bash gcc musl-dev
WORKDIR /app
ENV GO111MODULE=on
RUN go install go.minekube.com/gate@latest

# 第二阶段：轻量运行
FROM alpine:latest
RUN apk add --no-cache bash ca-certificates
WORKDIR /app
COPY --from=builder /go/bin/gate /usr/local/bin/gate

# 确保 PATH
ENV PATH="/usr/local/bin:${PATH}"

# 配置启动命令，指定WebSocket绑定端口和默认后端服务器
CMD sh -c "/gate --ws.bind :$PORT --lite.default_backend mc.hypixel.net:25565"

# 暴露WebSocket服务端口
EXPOSE $PORT
