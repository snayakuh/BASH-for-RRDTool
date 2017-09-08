# BASH-for-RRDTool
<b>Storing and displaying network performance data using RRDtool:</b>
At first two RRDtool files: one for the switch and another for the router with
two data sources (total bytes in and total bytes out) are created.
The written bash scripts runs in every 10 seconds and retrieve the total number of packets in and out using SNMP 
from the selected switch and router.Updates the corresponding RRDtool file also generates two graphs (one per device)
of the most recent (5 min) data every minute : each graph should have two plots: one for the “in” and another for the “out” packet rate. 
