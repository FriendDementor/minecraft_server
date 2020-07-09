# simple_mc_server
A simplified minecraft server creation

## Create and start server
```sh
sudo docker run -it -d -p 25565:25565 --name mcsv frienddementor/simple_mc_server
```

## Enter to server console
```sh
sudo docker exec -it mcsv screen -x
```
**IMPORTANT NOTE:** To exit without close the server press
**Ctrl+A** and later **D**

## Backup world

```sh
sudo docker exec -it mcsv tar -czf - -C / world > $(date '+%Y-%m-%d-%H-%M-%S')-backup.tar.gz
```

