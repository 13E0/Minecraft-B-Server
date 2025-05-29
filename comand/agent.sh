#!/bin/bash

# Check if a parameter is passed
if [ -z "$1" ]; then
    echo "No parameter provided. Please provide one."
    exit 1
fi

# The parameter passed to the script
PARAMETER=$1

# Switch case based on the parameter value
case $PARAMETER in
    init)
        echo "Init the docker agent..."
        docker run -d \
        -p 9001:9001 \
        -e AGENT_SECRET=whooimboutamakeanameformyselfyea \
        --name portainer_agent \
        --restart=always \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v /var/lib/docker/volumes:/var/lib/docker/volumes \
        -v /:/host \
        portainer/agent:2.27.6
        ;;
    start)
        echo "Starting the  docker agent..."
        docker start portainer_agent
        ;;
    stop)
        echo "Stopping the  docker agent..."
        docker stop portainer_agent
        ;;
    restart)
        echo "Restarting the  docker agent..."
        docker restart portainer_agent
        ;;
    *)
        echo "Invalid option. Please use one of the following: init ,start, stop, restart"
        exit 1
        ;;
esac
