# 第一阶段：构建
FROM golang:1.21 AS builder
RUN apt-get update && apt-get install -y git bash
WORKDIR /app
ENV GO111MODULE=on
RUN go install go.minekube.com/gate@latest

# 第二阶段：轻量运行
FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y bash ca-certificates
COPY --from=builder /go/bin/gate /usr/local/bin/gate
WORKDIR /app
ENV PATH="/usr/local/bin:${PATH}"

# 配置启动命令，指定WebSocket绑定端口和默认后端服务器
CMD sh -c "/gate --ws.bind :$PORT --lite.default_backend mc.hypixel.net:25565"

# 暴露WebSocket服务端口
EXPOSE $PORT
