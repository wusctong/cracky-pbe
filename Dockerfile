FROM ghcr.io/minekube/gate:latest

CMD ["sh", "-c", "echo PORT=$PORT && sleep 3600"]
# CMD ["sh", "-c", "gate --ws.bind :${PORT} --lite.default_backend mc.hypixel.net:25565"]
