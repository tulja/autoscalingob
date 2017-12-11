#!/bin/bash

#resolving sudo: unable to resolve host <vnf-name>
x=$(cat /etc/hostname)
sudo sed -i "1s/.*/127.0.0.1 localhost $x/" /etc/hosts

#auto discovery by zabbix
#updating Server=localhost --> Server=10.0.0.5 for discovery by zabbix server as host
line=$(sudo grep -n "Server=localhost" /etc/zabbix/zabbix_agent.conf | sed 's/^\([0-9]\+\):.*$/\1/')
sudo sed -i '${line}s/.*/Server=10.0.0.5/' /etc/zabbix/zabbix_agent.conf

#updating ServerActive=localhost:10051 --> ServerActive=10.0.0.5 for discovery by zabbix server as host
line=$(sudo grep -n "ServerActive=localhost:10051" /etc/zabbix/zabbix_agent.conf | sed 's/^\([0-9]\+\):.*$/\1/')
sudo sed -i '${line}s/.*/ServerActive=10.0.0.5:10051/' /etc/zabbix/zabbix_agent.conf

sudo systemctl restart zabbix-agent.service 
