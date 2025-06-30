#!/bin/bash
night_temperature=3750
morning_temperature=6000
hyprsunset_temp=$(hyprctl hyprsunset temperature)

if [ "$hyprsunset_temp" -eq "$night_temperature" ]; then
	echo "equals night temp"
	hyprctl hyprsunset temperature $morning_temperature
else
	echo "not equal night temp"
	hyprctl hyprsunset temperature $night_temperature
fi
