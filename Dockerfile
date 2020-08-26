FROM alpine:3.10.3

COPY docker-entrypoint.sh /usr/local/bin/

RUN apk --update upgrade 

RUN apk add --no-cache openjdk10

RUN apk add --no-cache screen

RUN mkdir /minecraft

RUN  wget -O /minecraft/minecraft_server.jar https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar

ENTRYPOINT (screen -d -m sh /usr/local/bin/docker-entrypoint.sh) && sh
