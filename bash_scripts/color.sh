#!/bin/bash

# the first 16 colors (0 - 15) are a collection
# the rest are collections of 6 colors

COLLECTION=0
COLOR=0
COLUMNS=6

while [[ $COLOR -lt 16 ]]; do
	echo -n "$(tput setaf $COLOR)#"
	COLOR=$(($COLOR+1))
done

echo ""

while [[ $COLOR -lt 255 ]]; do
	for (( i=0; i<$COLUMNS; i++ )); do
		echo -n "$(tput setaf $COLOR)#"
		COLOR=$(($COLOR+1))
	done
	echo ""
done



# Old way I was doing it
# COLUMNS = 16
# while [[ $COLOR -lt 255 ]]; do
# 
	# # print the first collection of colors
	# if [ $COLLECTION -lt 1 ]; then
		# for (( j=0; j<COLUMNS; j++ )); do
			# echo -n "$(tput setaf $COLOR)#"
			# COLOR=$(($COLOR+1))
		# done
		# echo ""
		# COLLECTION=$((COLLECTION+1))
	# else 	
		# COLUMNS=6
		# for (( j=0; j<$COLUMNS; j++ )); do
			# echo -n "$(tput setaf $COLOR)#"
			# COLOR=$(($COLOR+1))
		# done
		# echo ""
	# fi
# done

