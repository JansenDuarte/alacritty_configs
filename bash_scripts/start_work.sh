#!/bin/bash

source ~/00.jd_data/00.jd/slow_print.sh

#Wait aNd EXECute
wnexec(){
	local msg=$1
	local cmd=$2
	local wait_time=$3
	local is_background=$4

	slow_print "$msg"
	sleep $wait_time
	if [[ is_background ]]; then
		$cmd > /dev/null &
	else
		$cmd > /dev/null
	fi
}

#This script should be 'source'ed to exec properly
#this should not have an 'exit' statement at the end

clear
slow_print "Starting work layout"

wnexec "Sending terminal to 'Work' desktop and folowing" "wmctrl -r :ACTIVE: -t 1" 3
wnexec "Changing to desktop 1" "wmctrl -s 1" 0
wnexec "Starting Browser and tabs" "brave-browser-stable https://melius.bitrix24.com.br/workgroups/group/468/tasks/ --new-window" 3 true
wnexec "" "brave-browser-stable https://web.pontoicarus.com.br/ponto" 1 true
wnexec "" "brave-browser-stable https://web.whatcrm.net/messenger/11627/120363300450848844" 1 true
if [[ $1 == "-s" ]]; then
	wnexec "Starting apache2 service" "sudo systemctl start apache2" 3
	wnexec "Starting mariadb service" "sudo systemctl start mariadb" 3
fi
slow_print "Finished preparing env"
slow_print "Clearing terminal and changing to 'work' folder"
mount /media/jansenduarte/hdd/
wnexec "" "cd /media/jansenduarte/hdd/99.work/" 0

clear
