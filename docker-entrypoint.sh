echo Docker is love, Docker is life.
cd /minecraft
echo eula=true > eula.txt
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
