# sandstorm-server
Insurgency: Sandstorm Dedicated Server Docker Image

Build to create a containerized version of Insurgency: Sandstorm Dedicated Server
https://store.steampowered.com/app/581320/Insurgency_Sandstorm/

Build by hand
git clone https://github.com/antimodes201/sandstorm-server.git
docker build -t antimodes201/sandstorm-server:latest .

Docker Run with defaults 
change the volume options to a directory on your node and maybe use a different name then the one in the example

docker run -it -p 42433-42434:42433-42434/udp -v /app/docker/sandstorm:/sandstorm \
    -e INSTANCE_NAME="T3stN3t A Fancy Sandstorm Server in a Docker Container" \
    --name sandstorm \
    antimodes201/sandstorm-server:latest
    
Currently exposed environmental variables and their defaul values
INSTANCE_NAME default
GAME_PORT 42433
QUERY_PORT 42434
