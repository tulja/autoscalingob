#!/bin/bash
echo "Change the Directory to /opt/openbaton/scripts"
cd /opt/openbaton/scripts/
echo "Server has started and is listening at port number 8089"
#run the server
screen -d -m -S server ./server
