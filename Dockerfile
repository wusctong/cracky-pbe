FROM ghcr.io/minekube/gate:latest

# 拷贝配置
COPY config.yml /app/config.yml
WORKDIR /app
CMD ["gate", "--config", "/app/config.yml"]
