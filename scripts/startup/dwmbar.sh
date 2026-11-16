#!/usr/bin/env bash

#####################
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

        dte="$(date +"%Y.%m.%d ${hour}:%M")"
    else
        dte="$(date +'%Y.%m.%d %R')"
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

# TODO: Instead of sleeping, store the previous reading in globals and compare
# against it on the next tick, measuring the usage of the last full interval.
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

# Print the charge of the battery described by the 'acpi' line in $1.
batt_line() {
    local state
    local charge
    state="$(echo "$1" | awk '{print $3}')"

    if [ "$state" == 'Charging,' ]; then
        # If battery is being charged we display a different icon
        charge="+$(echo "$1" | awk '{print $4}')"
    elif [ "$state" == 'Not' ]; then
        # If battery is not being charged we use the 5th field
        charge="$(echo "$1" | awk '{print $5}')"
    else
        # If battery is being discharged we use the 4th field
        charge="$(echo "$1" | awk '{print $4}')"
    fi

    # Check for weird commas
    if [[ $charge == *','* ]]; then
        charge=${charge::-1}
    fi

    echo "$charge"
}

# Print the charge of every battery reported by 'acpi', separated by commas.
batt() {
    local line
    local result=''

    while read -r line; do
        [ -z "$line" ] && continue
        [ -n "$result" ] && result+=', '
        result+="$(batt_line "$line")"
    done <<< "$(acpi 2>/dev/null)"

    echo "$result"
}

bt() {
    systemctl status bluetooth &>/dev/null
    exit_status=$?

    if [ $exit_status -eq 3 ]; then
        echo "Disabled"
        return
    elif [ $exit_status -ne 0 ]; then
        return  # Unknown, don't show
    fi

    connected_devices="$(bluetoothctl devices Connected)"
    if [ -z "$connected_devices" ] || [ "$connected_devices" == "No default controller available" ]; then
        echo "Disconnected"
        return
    fi

    num_connected_devices="$(echo "$connected_devices" | wc -l)"
    if [ "$num_connected_devices" -eq 1 ]; then
        # First two columns are "Device" and the MAC.
        echo "$connected_devices" | cut -d ' ' -f 3-
    elif [ "$num_connected_devices" -gt 1 ]; then
        echo "[...]"
    fi
}

# Format the bar from the cached 's_*' values, updated in the main loop.
status() {
    echo -n " CPU: $s_cpu | Mem: $s_mem | Disk: $s_dsk | "

    # NOTE: VPN is commented for now.
    #echo -n "VPN: $(vpn) | "

    if [ -n "$s_bt" ]; then
        echo -n "BT: $s_bt | "
    fi

    if [ -n "$s_batt" ]; then
        echo -n "Batt: $s_batt | "
    fi

    echo "Vol: $s_vol | $s_dte "
}

# Each element is refreshed only when 'tick' is a multiple of its interval (in
# seconds), and the bar is redrawn every tick using the cached values. The tick
# wraps every hour; this must be a multiple of every interval.
tick=0
while true; do
    (( tick % 2  == 0 )) && { s_cpu="$(cpu)"; s_mem="$(mem)"; }
    (( tick % 5  == 0 )) && { s_vol="$(vol)"; s_bt="$(bt)"; }
    (( tick % 10 == 0 )) && s_dte="$(dte)"
    (( tick % 30 == 0 )) && s_batt="$(batt)"
    (( tick % 60 == 0 )) && s_dsk="$(dsk)"

    xsetroot -name "$(status)"
    tick=$(( (tick + 1) % 3600 ))
    sleep 1
done &
