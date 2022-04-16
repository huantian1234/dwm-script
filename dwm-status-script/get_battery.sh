get_acpi(){
	sec=$(date +%S)
    
    next_sec=`expr $1 + 1`
    if [ $next_sec -gt 60 ]
    then next_sec="1"
    fi
	if [ ${sec} -eq $1 ] || [ ${sec} -eq $next_sec ]
	then 
		Battery_status="$(acpi |awk '{print $3}')"
		Battery_num="0%"
		if [ "${Battery_status}" = "Not" ]
		then
			Battery_status="不在充电"
			Battert_num=$(acpi |awk '{print $5}')
		fi
		
		echo "${Battert_num} ${Battery_status}"
	fi
	echo "Null"
	
}
get_acpi $1
