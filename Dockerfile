FROM alpine:latest

# 安装 bash 和 ca-certificates
RUN apk add --no-cache bash ca-certificates

# 复制 Gate 二进制和模板配置文件
COPY gate /usr/local/bin/gate
COPY config.template.yml /app/config.template.yml
RUN chmod +x /usr/local/bin/gate

WORKDIR /app
ENV PATH="/usr/local/bin:${PATH}"

# 使用启动脚本动态生成 config.yml 并启动 Gate
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
