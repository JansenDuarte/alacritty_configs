#!/bin/bash

slow_print(){
	local msg=$1
	local l=${#msg}
	for (( i=0; i<$l; i++ )); do
		echo -n "${msg:$i:1}"
		sleep 0.025
	done
	echo ""
}
