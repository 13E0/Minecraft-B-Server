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
    start)
        echo "Starting the docker..."
        docker start mcv-docker-0.1
        ;;
    stop)
        echo "Stopping the process..."
        docker stop mcv-docker-0.1
        ;;
    restart)
        echo "Restarting the process..."
        docker restart mcv-docker-0.1
        ;;
    console)
        echo "Checking the process status..."
        docker exec -i mcv-docker-0.1 rcon-cli
        ;;
    logs)
        echo "Checking the process status..."
        docker container logs mcv-docker-0.1
        ;;
    *)
        echo "Invalid option. Please use one of the following: start, stop, restart, status"
        exit 1
        ;;
esac
