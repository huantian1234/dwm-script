#!/bin/bash
now="$(date +%S)"
Battery=$(bash ~/script/dwm-status-script/get_battery.sh ${now})
Battery_save=$Battery
#返回值有空格视为两个参数
while true
do
	Battery=$(bash ~/script/dwm-status-script/get_battery.sh ${now})
	if [ $Battery = "Null" ]
	then
		echo $Battery
		bash ~/script/dwm-status-refresh.sh $Battery_save
	else
		bash ~/script/dwm-status-refresh.sh $Battery
		Battery_save=$Battery
	fi
	sleep 2
done
