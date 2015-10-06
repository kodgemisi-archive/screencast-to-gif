#!/bin/bash

duration=`zenity --entry --title="Duration in seconds" --text="Duration in seconds"`
delay=0

if [[ -z $duration ]]; then
	zenity --error --text "Duration is empty!"
	exit
fi

re='^[0-9]+$'
if ! [[ $duration =~ $re ]]; then
	zenity --error --text "Duration is invalid!"
	exit
fi

defaultFile=$HOME"/Desktop/out_"`date +%s`".gif"
file=`zenity --file-selection --save --confirm-overwrite --filename=$defaultFile`

selection=`slop -t 0 --opengl --format "--x=%x --y=%y --width=%w --height=%h"`

./tick.sh &
tickPid=$!
byzanz-record --verbose --delay=$delay $selection --duration=$duration $file
kill $tickPid
aplay dong.wav -q