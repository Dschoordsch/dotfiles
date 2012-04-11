#!/bin/bash
TAGS="ctags --recurse=yes --exclude=typeof --exclude=phoenix --sort=yes --c++-kinds=+p --fields=aikmsSt --extra=+q --links=no --totals=yes -f tags/"
ALL=("/usr/include/rtt/"
"/usr/include/opencv/"
"/usr/include/stdlib.h"
"/usr/include/vxl/"
"/usr/include/eigen3/"
"/usr/include/boost/"
)
for X in $(seq 0 $((${#ALL[@]} - 1))); do
	echo "${ALL[$X]}"
	B=`basename ${ALL[$X]}`
	`$TAGS$B ${ALL[$X]}`
done;

QT=`find /usr/include/ -mindepth 1 -maxdepth 1 -name Qt* -type d`
`${TAGS}qt $QT`
