#!/bin/bash

sudo apt-get update && sudo apt-get install -y iperf screen
sudo apt-get install iperf3 
DEBIAN_FRONTEND=noninteractive  sudo apt-get install snmpd -y

