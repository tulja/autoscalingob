#copy configuration to /etc/zabbix-agent/

cd /opt/openbaton/scripts/
sudo cp zabbix_agentd.conf /etc/zabbix/
sudo systemctl restart zabbix-agent.service 
#cat /etc/zabbix/zabbix_agentd.conf
echo "restarted zabbix-agent.service"
