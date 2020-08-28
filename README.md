# simple_mc_server
A simple **Minecraft Java Edition Server** container.

## Running the container
```
# docker run --name mcsv \
  --publish 25565:25565 \
  --volume minecraft:/minecraft \
  -d frienddementor/simple_mc_server
```

## Enter the server console
```
# docker exec -it mcsv screen -x
```
**IMPORTANT NOTE:** To exit the console without closing the server, detach from it by pressing
**Ctrl+a** and then **d**.

## Stopping the container
```
# docker stop -t 90 mcsv
```
Omitting the `-t 90` flag might corrupt the world.

## Restarting the container
```
# docker restart -t 90 mcsv
```
Don't forget about the `-t 90` flag.

Thanks for the response [here](https://unix.stackexchange.com/questions/13953/sending-text-input-to-a-detached-screen) on convenient GNU Screen usage.
Thanks to **Hynek Schlawack** for his [post](https://hynek.me/articles/docker-signals/) on capturing signals inside Docker containers.
