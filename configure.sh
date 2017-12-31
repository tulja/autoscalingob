#!/bin/bash
echo "Change the Directory to /opt/openbaton/scripts"
cd /opt/openbaton/scripts/
echo "second VNF start no depenedency"
#wait for 10 seconds for server to become active 

# ./client $server_private > client_output.txt
screen -d -m -S my ./scnd
