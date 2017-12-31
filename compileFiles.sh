#!/bin/bash
echo "Change dir to Scripts Folder " 
cd /opt/openbaton/scripts/
echo "Compiling the client and server programs"
sudo g++ fst.cpp -o fst
sudo g++ scnd.cpp -o scnd
sudo g++ thrd.cpp -o thrd
ls
echo "Done!"
