#!/bin/bash

#resolving sudo: unable to resolve host <vnf-name>
x=$(cat /etc/hostname)
sudo sed -i "1s/.*/127.0.0.1 localhost $x/" /etc/hosts
echo "changing hostname --> $x"

echo " ****************  EXPORT -p **************************"
export -p
echo " ****************  EXPORT -p **************************"

echo " ****************  env **************************"
env
echo " ****************  env **************************"

#auto discovery by zabbix
#updating Server=localhost --> Server=10.0.0.5 for discovery by zabbix server as host

echo " ****************  zabbix_server_ip **************************"
echo $zabbixserverip
echo " ****************  zabbix_server_ip **************************"

echo "changing server IP"
sudo sed -i "s+localhost+$zabbixserverip+g" /etc/zabbix/zabbix_agentd.conf

sudo systemctl restart zabbix-agent.service 
#cat /etc/zabbix/zabbix_agentd.conf
echo "restarted zabbix-agent.service"
