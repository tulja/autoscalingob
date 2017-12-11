#!/bin/bash

#resolving sudo: unable to resolve host <vnf-name>
x=$(cat hostname)
sudo sed -i "1s/.*/127.0.0.1 localhost $x/" hosts

#auto discovery by zabbix
#updating Server=localhost --> Server=10.0.0.5 for discovery by zabbix server as host
line=$(sudo grep -n "Server=localhost" zabbix_agent.conf | sed 's/^\([0-9]\+\):.*$/\1/')

if ! [ -z "$line" ]
then
  sudo sed -i "${line}s/.*/Server=10.0.0.5/" zabbix_agent.conf
fi

#updating ServerActive=localhost:10051 --> ServerActive=10.0.0.5 for discovery by zabbix server as host
line=$(sudo grep -n "ServerActive=localhost:10051$" zabbix_agent.conf | sed 's/^\([0-9]\+\):.*$/\1/')

if ! [ -z "$line" ]
then
  sudo sed -i "${line}s/.*/ServerActive=10.0.0.5:10051\n/" zabbix_agent.conf
fi

sudo systemctl restart zabbix-agent.service 
