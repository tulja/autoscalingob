#!/bin/bash
echo "Change the Directory to /opt/openbaton/scripts"
cd /opt/openbaton/scripts/
echo "Client has started and is trying to connect to Server at port number 8089"

echo "********************"
echo "second_private private is " , $second_private
echo "********************"

# ./client $server_private > client_output.txt
screen -d -m -S my ./fst $second_private
