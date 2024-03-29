#!/bin/bash

# Start script for Sandstorm Dedicated Server Docker Image

/steamcmd/steamcmd.sh +login anonymous +force_install_dir /sandstorm +app_update 581330 +quit
if [ ${GSLT} == "default" ]
then
	# not set dont start with GSLT
	printf "/sandstorm/Insurgency/Binaries/Linux/InsurgencyServer-Linux-Shipping -hostname=\"${INSTANCE_NAME}\" -Port=${GAME_PORT} -QueryPort=${QUERY_PORT} \n" > /sandstorm/launch.var
	/sandstorm/Insurgency/Binaries/Linux/InsurgencyServer-Linux-Shipping -hostname=\"${INSTANCE_NAME}\" -Port=${GAME_PORT} -QueryPort=${QUERY_PORT} 
else
	# Use GSLT Token
	printf "/sandstorm/Insurgency/Binaries/Linux/InsurgencyServer-Linux-Shipping -hostname=\"${INSTANCE_NAME}\" -Port=${GAME_PORT} -QueryPort=${QUERY_PORT} -GSLTToken=${GSLT} -GameStats\n" > /sandstorm/launch.var
	/sandstorm/Insurgency/Binaries/Linux/InsurgencyServer-Linux-Shipping -hostname=\"${INSTANCE_NAME}\" -Port=${GAME_PORT} -QueryPort=${QUERY_PORT} -GSLTToken=${GSLT} -GameStats
fi
