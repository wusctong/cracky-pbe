# 使用轻量级 Alpine 镜像
FROM alpine:latest

# 安装 bash 和 ca-certificates（Gate 可能需要 TLS 支持）
RUN apk add --no-cache bash ca-certificates

# 复制本地下载好的 Gate 二进制到容器
COPY gate /usr/local/bin/gate
COPY config.yml /app/config.yml
RUN chmod +x /usr/local/bin/gate

# 设置工作目录
WORKDIR /app

# 确保 gate 可执行文件在 PATH
ENV PATH="/usr/local/bin:${PATH}"

# 配置启动命令，指定WebSocket绑定端口和默认后端服务器
# CMD sh -c "gate --ws.bind :$PORT --lite.default_backend mc.hypixel.net:25565"
CMD ["sh", "-c", "envsubst < /app/config.yml > /app/config_render.yml && gate --config /app/config_render.yml"]

# 暴露WebSocket服务端口
EXPOSE $PORT
