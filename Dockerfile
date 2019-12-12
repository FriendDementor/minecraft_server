FROM alpine:3.10.3

COPY docker-entrypoint.sh /usr/local/bin/

RUN apk --update upgrade 

RUN apk add --no-cache openjdk10

RUN apk add --no-cache screen

RUN  wget -O minecraft_server.jar https://launcher.mojang.com/v1/objects/e9f105b3c5c7e85c7b445249a93362a22f62442d/server.jar

ENTRYPOINT (screen -d -m sh /usr/local/bin/docker-entrypoint.sh) && sh
