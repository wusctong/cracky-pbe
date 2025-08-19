# 基于官方Gate镜像作为基础
FROM ghcr.io/minekube/gate:latest

# 设置工作目录（可选，根据需要调整）
WORKDIR /app

# 配置启动命令，指定WebSocket绑定端口和默认后端服务器
CMD sh -c "gate --ws.bind :$PORT --lite.default_backend mc.hypixel.net:25565"

# 暴露WebSocket服务端口
EXPOSE $PORT
