#!/bin/bash
# 如果 PORT 没设置，使用默认 25565
PORT=${PORT:-25565}

# 替换模板里的 __PORT__ 为实际端口
sed "s/__PORT__/${PORT}/g" /app/config.template.yml > /app/config.yml

# 启动 Gate
exec /usr/local/bin/gate --config /app/config.yml
