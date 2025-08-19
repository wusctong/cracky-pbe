FROM debian:bookworm-slim

# 安装依赖
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# 下载 Gate release (替换为最新版本号)
RUN curl -L https://github.com/minekube/gate/releases/download/v0.7.2/gate-0.7.2-linux-amd64.zip -o gate.zip \
    && unzip gate.zip -d /usr/local/bin \
    && rm gate.zip

# 启动命令
CMD ["gate", "--ws.bind", ":8080", "--lite.default_backend", "mc.hypixel.net:25565"]
