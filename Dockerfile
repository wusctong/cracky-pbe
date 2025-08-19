FROM ghcr.io/minekube/gate:latest

ENV PORT=8080

CMD ["sh", "-c", "gate --ws.bind :${PORT} --lite.default_backend mc.hypixel.net:25565"]

