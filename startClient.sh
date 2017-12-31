#!/bin/bash
echo "Change the Directory to /opt/openbaton/scripts"
cd /opt/openbaton/scripts/
echo "Client has started and is trying to connect to Server at port number 8089"
#wait for 10 seconds for server to become active 
sleep 10s 
screen -d -m -S client ./client $server_private 
