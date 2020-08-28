FROM alpine:3.12.0

RUN apk --update upgrade 
RUN apk add --no-cache openjdk10
RUN apk add --no-cache screen

RUN mkdir /minecraft

# Minecraft Java Edition Server ver. 1.16.2.
RUN wget -O /minecraft_server.jar https://launcher.mojang.com/v1/objects/c5f6fb23c3876461d46ec380421e42b289789530/server.jar

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
