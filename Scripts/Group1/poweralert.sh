#!/bin/sh

current_battery=$(acpi | awk '{print $4}')
current_battery_number=${current_battery::-1}
if [[ $current_battery_number < 20 ]]
then
	poweralert-window.sh
fi


