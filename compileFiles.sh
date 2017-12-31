#!/bin/bash
echo "Change dir to Scripts Folder " 
cd /opt/openbaton/scripts/
echo "Compiling the client and server programs"
sudo g++ client.cpp -o client
sudo g++ server.cpp -o server
ls
echo "Done!"
