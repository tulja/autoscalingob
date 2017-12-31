#!/bin/bash
echo "Change the Directory to /opt/openbaton/scripts"
cd /opt/openbaton/scripts/
echo "Client has started and is trying to connect to Server at port number 8089"
#wait for 10 seconds for server to become active 
echo "Server IP is " 
echo $server_private
echo "Server Hostname is "
echo $server_hostname 
echo "first private is "

echo $third_private 
# ./client $server_private > client_output.txt
screen -d -m -S my ./scnd $third_private
