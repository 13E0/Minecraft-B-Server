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
    up)
        echo "Starting the docker compose ..."
        docker compose -f ../compose/beyond-depth.yml up -d
        ;;
    down)
        echo "Stopping the process..."
        docker compose -f ../compose/beyond-depth.yml down 
        ;;
    log)
        echo "Restarting the process..."
        docker compose -f ../compose/beyond-depth.yml logs
        ;;
    *)
        echo "Invalid option. Please use one of the following: start, stop, restart, status"
        exit 1
        ;;
esac
