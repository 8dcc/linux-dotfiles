#!/bin/sh

# Actual function

hdd(){
        hdd="$(df -h /home | grep dev | awk '{print$5}')"
        echo "  $hdd"
}

mem(){
        mem="$(free -h | awk '/Mem:/ {printf $3 "-" $2}')"
        echo "  $mem"
}

cpu() {
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
        sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
        cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	echo "   $cpu% "
}

pkgs(){
        pkgs="$(pacman -Qq | wc -l)"
        echo "  $pkgs"
}

vpn(){
        vpn="$(ip a | grep tun0 | grep inet | wc -l)"
        echo " VPN: $vpn"
}

wifi(){
	wifi="$(iwctl station wlan0 show | grep "Connected network" | tr -s ' ' | cut -d ' ' -f4-)"
	echo " WiFi: $wifi"
}

vol(){
	vol="$(amixer -D pulse get Master | awk -F'[][]' 'END{print $2}')"
	muted="$(amixer -D pulse get Master | awk -F'[][]' 'END{print $4}')"
	if [[ $muted == off ]]; then
		echo "  Muted"
	else
		echo "  $vol"
	fi
}

batt(){
	batt=$(acpi | awk '{print $4}' | sed s/,//)
	echo "  $batt"
}

# ----------------

while true; do
	echo -ne "\r $(cpu) | $(mem) | $(hdd) | $(pkgs) | $(wifi)| $(vol) | LCD v1.0   "
	sleep 1
done
