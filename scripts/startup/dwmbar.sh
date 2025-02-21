#!/usr/bin/env bash

#####################
multibattery=false  #
hourchange=false    #
hourdiff=-1         # Ignored if !hourchange
#####################

dte() {
    if [ "$hourchange" == true ]; then
        hour=$(date +'%H')

        # Subtract one from the hour unless it is 00.
        if [ "$hour" == '00' ]; then
            hour=23
        else
            hour=$((hour + hourdiff))
        fi

        # If (0 <= X <= 9) after substracting, prepend a zero.
        if [ 0 -le "$hour" ] && [ "$hour" -le 9 ]; then
            hour="0${hour}"
        fi

        dte="$(date +"%y.%m.%d ${hour}:%M")"
    else
        dte="$(date +'%y.%m.%d %R')"
    fi

    echo "$dte"
}

dsk() {
    hdd="$(df -h /home | grep dev | awk '{print$5}')"
    echo "$hdd"
}

mem() {
    mem="$(free -h | grep 'Mem:' | tr -s ' ')"
    mem_t="$(echo "$mem" | cut -d ' ' -f 2)"
    mem_c="$(echo "$mem" | cut -d ' ' -f 3)"
    echo "${mem_c}/${mem_t}"
}

cpu() {
    read -r cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read -r cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo "${cpu}%"
}

pkgs() {
    pkgs="$(apt list --installed | wc -l)"
    echo "$pkgs"
}

vpn() {
    # Search for WireGuard interfaces.
    inets=$(ip a | grep 'wg.*[[:digit:]]\+' | grep '^[[:space:]]\+inet' | head -n 1)
    if [ -n "$inets" ]; then
        # Print the last field using GNU awk.
        echo "$inets" | awk -F ' ' '{print $(NF)}'
    else
        echo 'None'
    fi
}

vol() {
    status="$(amixer get Master | tail -n 1)"
    if [[ "$status" =~ \[off\]$ ]]; then
        echo 'Muted'
    else
        vol="$(echo "$status" | awk -F'[][]' 'END{print $2}')"
        echo "$vol"
    fi
}

batt() {
    if [ "$multibattery" == false ]; then
        if [ "$(acpi | awk '{print $3}')" == 'Charging,' ]; then
            # If battery is being charged we display a different icon
            batt1="+$(acpi | awk '{print $4}')"
        elif [ "$(acpi | awk '{print $3}')" == 'Not' ]; then
            # If battery is not being charged we use the 5th field
            batt1="$(acpi | awk '{print $5}')"
        else
            # If battery is being discharged we use the 4th field
            batt1="$(acpi | awk '{print $4}')"
        fi

        # Check for weird commas
        if [[ $batt1 == *','* ]]; then
            batt1=${batt1::-1}
        fi

        echo "$batt1"
    else
        # First battery
        if [ "$(acpi | head -n 1 | awk '{print $3}')" == 'Charging,' ]; then
            # If battery is being charged we display a different icon
            batt1="+$(acpi | head -n 1 | awk '{print $4}')"
        elif [ "$(acpi | head -n 1 | awk '{print $3}')" == 'Not' ]; then
            # If battery is not being charged we use the 5th field
            batt1="$(acpi | head -n 1 | awk '{print $5}')"
        else
            batt1="$(acpi | head -n 1 | awk '{print $4}')"
        fi

        # Second battery
        if [ "$(acpi | tail -n 1 | awk '{print $3}')" == 'Charging,' ]; then
            batt2="+$(acpi | tail -n 1 | awk '{print $4}')"
        elif [ "$(acpi | tail -n 1 | awk '{print $3}')" == 'Not' ];then
            batt2="$(acpi | tail -n 1 | awk '{print $5}')"
        else
            batt2="$(acpi | tail -n 1 | awk '{print $4}')"
        fi

        # Check for weird commas
        if [[ $batt1 == *','* ]]; then
            batt1=${batt1::-1}
        fi
        if [[ $batt2 == *','* ]]; then
            batt2=${batt2::-1}
        fi

        echo "${batt1}, ${batt2}"
    fi
}

status() {
    local battery
    battery="$(batt)"

    echo -n " Cpu: $(cpu) | Mem: $(mem) | Disk: $(dsk) | VPN: $(vpn) | "
    if [ ! -z "$battery" ]; then
        echo -n "Batt: $(batt) | "
    fi
    echo "Vol: $(vol) | $(dte) "
}

while true; do
    xsetroot -name "$(status)"
    sleep 5
done &
