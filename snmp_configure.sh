sudo mv /etc/snmp/snmpd.conf  /etc/snmp/snmpd.conf.org
#####
#Create a new /etc/snmp/snmpd.conf file with below contents :
cd /etc/snmp/
sudo rm snmpd.conf 
sudo touch snmpd.conf
echo "rocommunity  public" > snmpd.conf
echo "syslocation  \"PDC, Peters DataCenter\"" >> snmpd.conf
echo "syscontact  peter@it-slav.net" >> snmpd.conf
sudo rm snmpd
############


cd /opt/openbaton/scripts/
sudo cp zabbix_agentd.conf /etc/zabbix/
sudo cp snmpd /etc/default/
sudo /etc/init.d/snmpd restart
echo "started snmpd.service"
sudo systemctl start zabbix-agent.service 
#cat /etc/zabbix/zabbix_agentd.conf
echo "started zabbix-agent.service"
