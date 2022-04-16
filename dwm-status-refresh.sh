#!bin/bash
get_date(){
	date +"%F %R"
}
get_vol(){
	#获取音量大小我叶不知道为什么这样子写
	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	echo -e "${volume}%🕪"
}

xsetroot -name "电池:$1 $2 $(get_vol) $(get_date)"
