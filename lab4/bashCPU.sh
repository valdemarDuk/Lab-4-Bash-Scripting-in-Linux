#!/bin/bash
# by serge hould
# Modified by Valdemar Duk 02/12/2019
#
#Script edited to write alert of cpu over-usage (>90%) through user LED indication
#and upon hitting this alert point, logs a percentage and date to the 
# /var/log/syslog file.

PREV_TOTAL=0
PREV_IDLE=0
MAX=90

while true; do
        # Get the total CPU statistic.
        CPU=($(cat "/proc/stat"))
	TIMEDATE=($(cat "/etc/timestamp"))
        IDLE=${CPU[4]} # Just the idle CPU time.

        # Calculate the total CPU time.
        TOTAL=0
        let "TOTAL=${CPU[1]}+${CPU[2]}+${CPU[3]}+${CPU[4]}"
  # Calculate the CPU usage since we last checked.
        let "DIFF_IDLE=$IDLE-$PREV_IDLE"
        let "DIFF_TOTAL=$TOTAL-$PREV_TOTAL"
        let "DIFF_USAGE=(1000*($DIFF_TOTAL-$DIFF_IDLE)/$DIFF_TOTAL+5)/10"
        echo -en "\b\b"
        echo -en "\rCPU: $DIFF_USAGE%"
	
	if [ $DIFF_USAGE -gt 90 ]
	then 
		/home/project/bashled 1 on
		echo $TIMEDATE $DIFF_USAGE% >> /var/log/syslog 
	else
		/home/project/bashled 1 off
	fi

        # Remember the total and idle CPU times for the next check.
        PREV_TOTAL="$TOTAL"
        PREV_IDLE="$IDLE"
        # Wait before checking again.
        sleep 1


done
