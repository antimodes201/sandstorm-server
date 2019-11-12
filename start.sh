#!/bin/bash

# Start script for Sandstorm Dedicated Server Docker Image

/steamcmd/steamcmd.sh +login anonymous +force_install_dir /sandstorm +app_update 581330 +quit
/sandstorm/Insurgency/Binaries/Linux/InsurgencyServer-Linux-Shipping -hostname=\"${INSTANCE_NAME}\" -Port=${GAME_PORT} -QueryPort=${QUERY_PORT} 
