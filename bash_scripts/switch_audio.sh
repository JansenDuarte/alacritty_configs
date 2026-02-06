#!/bin/bash
current_output=$(pactl get-default-sink)
outputs=($(pactl list short sinks | awk '{print $2}'))

for i in "${!outputs[@]}"; do
	if [[ "${outputs[i]}" == "$current_output" ]]; then
		next_index=$(((i+1) % ${#outputs[@]}))
		pactl set-default-sink "${outputs[next_index]}"
		dev_name=($(echo ${outputs[next_index]} | cut -d"." -f2))
		echo "Changed audio output to: $dev_name"
		break
	fi
done
