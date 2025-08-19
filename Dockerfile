FROM ghcr.io/minekube/gate:latest

CMD ["gate", "--lite.default_backend", "mc.hypixel.net:25565", "--ws.bind", ":8080"]
