#!/bin/bash

slow_print(){
	if [[ $# -eq 0 ]] then
		echo "No arguments passed to slow_print"
		return 2
		exit
	fi

	if [[ -z $1 ]] then
		echo "First arg should be the message"
		return 4
		exit
	fi

	if [[ $# -eq 2 ]] then
		if [[ $2 =~ \- ]] then
			echo "Preventing negative sleep"
			return 8
			exit
		fi

		if ! [[ $2 =~ ^[0-9]*\.*[0-9]+$ ]] then
			echo "Second arg should be a number"
			return 16
			exit
		fi

		local sleep_timer=$2
	else
		local sleep_timer=0.025
	fi


	local msg=$1
	local l=${#msg}
	for (( i=0; i<$l; i++ )); do
		echo -n "${msg:$i:1}"
		sleep $sleep_timer
	done
	echo ""
}
