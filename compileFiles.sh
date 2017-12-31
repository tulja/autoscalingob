#!/bin/bash
echo "Change dir to Scripts Folder " 
cd /opt/openbaton/scripts/
echo "Compiling the client and server programs"
sudo g++ fst.cpp -lpthread -std=c++11 -o fst
sudo g++ scnd.cpp -lpthread -std=c++11 -o scnd
sudo g++ thrd.cpp -lpthread -std=c++11 -o thrd
ls
echo "Done!"
