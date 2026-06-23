percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {print $2}')
cycles=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/charge-cycles/ {print $2}')
full_design=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/energy-full-design/ {print $2}')
full_now=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/energy-full:/ {print $2}')

printf 'Percentage: %s\n' $percentage
printf 'Charge cycles: %s\n' $cycles
printf 'Battery capacity full: %s Wh\n' $full_now
printf 'Battery design capacity: %s Wh\n' $full_design
