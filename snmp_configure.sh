sudo mv /etc/snmp/snmpd.conf  /etc/snmp/snmpd.conf.org
#####
#Create a new /etc/snmp/snmpd.conf file with below contents :
cd /etc/snmp/
sudo rm snmpd.conf 
sudo touch snmpd.conf
echo "rocommunity  public" > snmpd.conf
echo "syslocation  \"IIT HYDERABAD\"" >> snmpd.conf
echo "syscontact  cs16mtech11020@iith.ac.in" >> snmpd.conf

############

sudo /etc/init.d/snmpd restart
