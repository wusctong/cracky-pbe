#!/bin/bash

# 确保 PORT 有值
if [ -z "$PORT" ]; then
  echo "Error: PORT environment variable not set"
  exit 1
fi

# 替换占位符生成 config.yml
sed "s/__PORT__/${PORT}/g" /app/config.template.yml > /app/config.yml

# 启动 Gate
exec /usr/local/bin/gate --config /app/config.yml
