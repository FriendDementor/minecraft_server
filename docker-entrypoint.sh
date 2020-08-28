#!/bin/sh

# This function checks whether GNU screen exited gracefully.
server_wait()
{
	while [ true ]
	do
		if [ -f "serv_stop" ]; then
			rm serv_stop
			break
		fi
		sleep 1
	done
}

cleanup()
{
	echo "Shutting down..."
	screen -p 0 -X stuff "stop$(echo -ne '\r')"
	server_wait
	echo "Graceful shutdown."
	kill -s SIGINT 1
}
trap "cleanup" SIGTERM 	# Triggers "cleanup" on "docker stop."

cd minecraft

if [ ! -f minecraft_server.jar ]; then
	cp ../minecraft_server.jar .
fi

echo eula=true > eula.txt 	# Signing EULA is required to launch the Minecraft server.
screen -d -m sh -c "echo 'Docker is love, Docker is life.' && java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui && echo 1 > serv_stop" 	# The echo is used by server_wait.
sleep infinity &

wait $!
