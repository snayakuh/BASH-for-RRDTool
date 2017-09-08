#!/bin/bash
rrdtool graph switch_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -300 --end now \
--font DEFAULT:7: \
--watermark "`date`" \
--title "Status of Packets IN & OUT at Switch" \
--vertical-label "Total PacketsIn" \
--right-axis-label " Total PacketsIn " \
--right-axis 1:0 \
--alt-autoscale-max \
--x-grid SECOND:10:MINUTE:1:MINUTE:1:0:%R \
--alt-y-grid --rigid \
DEF:PacketsIn=switch.rrd:TotalIn:LAST \
DEF:PacketsOut=switch.rrd:TotalOut:LAST \
GPRINT:PacketsIn:AVERAGE:"InAvg\: %5.2lf" \
GPRINT:PacketsIn:MAX:"InMax\: %5.2lf" \
GPRINT:PacketsIn:MIN:"InMin\: %5.2lf\t\t\t" \
GPRINT:PacketsOut:AVERAGE:"OutAvg\: %5.2lf" \
GPRINT:PacketsOut:MAX:"OutMax\: %5.2lf" \
GPRINT:PacketsOut:MIN:"OutMin\: %5.2lf\t\t\t" \
AREA:PacketsIn#FF0000:PacketsIn \
AREA:PacketsOut#0000FF:PacketsOut

rrdtool graph router_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -300 --end now \
--font DEFAULT:7: \
--watermark "`date`" \
--title "Status of Packets IN & OUT at Router" \
--vertical-label "Total PacketsIn" \
--right-axis-label " Total PacketsIn " \
--right-axis 1:0 \
--alt-autoscale-max \
--x-grid SECOND:10:MINUTE:1:MINUTE:1:0:%R \
--alt-y-grid --rigid \
DEF:PacketsOut=router.rrd:TotalOut:LAST \
DEF:PacketsIn=router.rrd:TotalIn:LAST \
GPRINT:PacketsIn:AVERAGE:"InAvg\: %5.0lf" \
GPRINT:PacketsIn:MAX:"InMax\: %5.0lf" \
GPRINT:PacketsIn:MIN:"InMin\: %5.0lf\t\t\t" \
GPRINT:PacketsOut:AVERAGE:"OutAvg\: %5.0lf" \
GPRINT:PacketsOut:MAX:"OutMax\: %5.0lf" \
GPRINT:PacketsOut:MIN:"OutMin\: %5.0lf\t\t\t" \
AREA:PacketsIn#FF0000:PacketsIn \
AREA:PacketsOut#0000FF:PacketsOut

