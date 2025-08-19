#!/bin/bash

# 检查 PORT 是否存在
if [ -z "$PORT" ]; then
  echo "Error: PORT environment variable not set"
  exit 1
fi

rm -f /app/config.yml
# 使用 sed 替换 __PORT__ 为实际端口
sed "s/__PORT__/$PORT/g" /app/config.template.yml > /app/config.yml

# 确认生成文件正确
echo "Using PORT=$PORT"
cat /app/config.yml

echo "Starting fake HTTP server on port $HTTP_FAKE_PORT for Render health check..."
nohup bash -c "while true; do echo -e 'HTTP/1.1 200 OK\n\nok' | nc -l -p $HTTP_FAKE_PORT; done" &

# 启动 Gate
exec /usr/local/bin/gate -c /app/config.yml &
wait
