#!/bin/bash
 TotalInS=0
 TotalOutS=0
 echo "----------------Information for the Switch with  IP 10.10.10.129--------------------"
 echo "Device Name       := $(snmpget -Oqv -v1 -c public 10.10.10.129 SNMPv2-MIB::sysName.0 )"
 TotalInS=`expr $(snmpwalk -Oqv -v1 -c public 10.10.10.129 ifInUcastPkts | paste -sd + | bc) + $(snmpwalk -Oqv -v1 -c public 10.10.10.129 ifInNUcastPkts | paste -sd + | bc)`
 TotalOutS=`expr $(snmpwalk -Oqv -v1 -c public 10.10.10.129 ifOutUcastPkts | paste -sd + | bc) + $(snmpwalk -Oqv -v1 -c public 10.10.10.129 ifOutNUcastPkts | paste -sd + | bc)`
 echo "Total Packets IN  :=$TotalInS"
 echo "Total Packets OUT :=$TotalOutS"
 echo "Updating in RRD of switch..................................................."
 rrdtool update switch.rrd -t TotalIn:TotalOut N:$TotalInS:$TotalOutS
 
 TotalInR=0
 TotalOutR=0
 echo "----------------Information for the Router  with  IP 10.10.10.162--------------------"
 echo "Device Name       := $(snmpget -Oqv -v1 -c public 10.10.10.162 SNMPv2-MIB::sysName.0 )"
 TotalInR=`expr $(snmpwalk -Oqv -v1 -c public 10.10.10.162 ifInUcastPkts | paste -sd + | bc) + $(snmpwalk -Oqv -v1 -c public 10.10.10.162 ifInNUcastPkts | paste -sd + | bc)`
 TotalOutR=`expr $(snmpwalk -Oqv -v1 -c public 10.10.10.162 ifOutUcastPkts | paste -sd + | bc) + $(snmpwalk -Oqv -v1 -c public 10.10.10.162 ifOutNUcastPkts | paste -sd + | bc)`
 echo "Total Packets IN  :=$TotalInR"
 echo "Total Packets OUT :=$TotalOutR"
 echo "Updating in RRD of router....................................................."
 rrdtool update router.rrd -t TotalIn:TotalOut N:$TotalInR:$TotalOutR
 echo "!!!!!Updating Finished!!!!."

