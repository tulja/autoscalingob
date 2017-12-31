#!/bin/bash
echo "Change dir to Scripts Folder " 
cd /opt/openbaton/scripts/
echo "Compiling the first programs"
sudo g++ fst.cpp -lpthread -std=c++11 -o fst
echo "Compiling the second programs"
sudo g++ scnd.cpp -lpthread -std=c++11 -o scnd


echo "Compiling the third programs"
sudo g++ thrd.cpp -lpthread -std=c++11 -o thrd
ls
echo "Done!"
