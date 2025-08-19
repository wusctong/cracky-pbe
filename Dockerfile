FROM ghcr.io/minekube/gate:latest

FROM ghcr.io/minekube/gate:latest

# 确保 shell 解析环境变量
ENTRYPOINT ["sh", "-c"]
CMD ["gate --ws.bind :${PORT} --lite.default_backend mc.hypixel.net:25565"]

