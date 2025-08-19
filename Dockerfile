FROM ghcr.io/minekube/gate:latest

CMD ["gate", "--ws.bind", ":${PORT}", "--lite.default_backend", "mc.hypixel.net:25565"]
