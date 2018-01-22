#!/bin/bash

sudo systemctl stop zabbix-agent.service
sudo apt-get update && sudo apt-get install -y iperf screen
sudo apt-get install iperf3 
DEBIAN_FRONTEND=noninteractive  sudo apt-get install snmpd -y

