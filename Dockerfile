FROM ghcr.io/minekube/gate:latest
FROM alpine:latest

# Render 会覆盖 PORT
# ENV PORT=8080

# CMD 用单字符串，确保 shell 解析环境变量
CMD sh -c "gate --ws.bind :$PORT --lite.default_backend mc.hypixel.net:25565"
