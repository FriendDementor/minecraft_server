# simple_mc_server
A simplified minecraft server creation

## Create and start minecraft server
```sh
sudo docker run -it -d -p 25565:25565 --name mcsv frienddementor/simple_mc_server
```

## Enter to minecraft server console
```sh
sudo docker exec -it mcsv screen -x
```
**IMPORTANT NOTE:** To exit without close the server press
**Ctrl+A** and later **D**

## Backup world

```sh
# stop the mc server
sudo docker exec -it mcsv screen -p 0 -X stuff "stop^M"

# compress the world folder
sudo docker exec -it mcsv tar -czvf bu.tar.gz world

# copy the compresed file to host with the actual date
sudo docker cp mcsv:/bu.tar.gz $(date '+%Y-%m-%d-%H-%M-%S')-backup.tar.gz

# remove the compresed file of the container
sudo docker exec -it mcsv rm bu.tar.gz
```

## Restore backup

```sh
# if you want to secure backup and you have a world rename instead of delete
# the actual world folder
# sudo docker exec -it mcsv mv world world.old

# copy the backup file to container
sudo docker cp 1970-01-01-00-00-01-backup.tar.gz mcsv:/bu.tar.gz

# extract
sudo docker exec -it mcsv tar -xzvf bu.tar.gz

# remove the compresed file of the container
sudo docker exec -it mcsv rm bu.tar.gz


## if you are sure remove the temporary folder
# sudo docker exec -it mcsv rm -rf world.old
```


## Restart the server

```sh
sudo docker exec -it mcsv screen -p 0 -X stuff "stop^M"
sudo docker stop mcsv
sudo docker start mcsv
```

Thanks for the response [here](https://unix.stackexchange.com/questions/13953/sending-text-input-to-a-detached-screen)
