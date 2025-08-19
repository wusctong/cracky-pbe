FROM golang:1.23 AS build
RUN go install github.com/minekube/gate/cmd/gate@latest

FROM debian:bookworm-slim
COPY --from=build /go/bin/gate /usr/local/bin/gate

# 只监听 WebSocket，不绑定 25565
CMD ["gate", "--ws.bind", ":8080", "--lite.default_backend", "mc.hypixel.net:25565"]
