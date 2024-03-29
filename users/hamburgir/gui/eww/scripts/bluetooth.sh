#!/usr/bin/env bash

declare -A baticon=([10]="󰤾" [20]="󰤿" [30]="󰥀" [40]="󰥁" [50]="󰥂" [60]="󰥃" [70]="󰥄" [80]="󰥅" [90]="󰥆" [100]="󰥈")

toggle() {
	status=$(rfkill -J | jq -r '.rfkilldevices[] | select(.type == "bluetooth") | .soft' | head -1)

	if [ "$status" = "unblocked" ]; then
		rfkill block bluetooth
	else
		rfkill unblock bluetooth
	fi
}

status() {
	while true; do
		powered=$(bluetoothctl show | rg Powered | cut -f 2- -d ' ')
		status=$(bluetoothctl info)
		name=$(echo "$status" | rg Name | cut -f 2- -d ' ')
		mac=$(echo "$status" | head -1 | awk '{print $2}' | tr ':' '_')

		if [[ "$(echo "$status" | rg Percentage)" != "" ]]; then
			battery=$(upower -i /org/freedesktop/UPower/devices/headset_dev_"$mac" | rg percentage | awk '{print $2}' | cut -f 1 -d '%')
			batt_icon=${baticon[$battery]}
		else
			batt_icon=""
		fi

		if [ "$powered" = "yes" ]; then
			if [ "$status" != "Missing device address argument" ]; then
				text="Bluetooth on"
				icon=""
				color="#89b4fa"
			else
				icon=""
				text="Disconnected"
				color="#45475a"
			fi
			else
				icon=""
				text="Bluetooth off"
				color="#45475a"
		fi

		echo "{ \"icon\": \"$icon\", \"batt_icon\": \"$batt_icon\", \"text\": \"$text\", \"color\": \"$color\", \"tooltip\": \"\" }"

		sleep 3
	done
}

if [ "$1" = "toggle" ]; then
	toggle
else
	status
fi
