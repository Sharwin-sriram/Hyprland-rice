capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$status" = "Charging" ]; then
    text="\udb85\udc0b $capacity%"
    class="charging"
elif [ "$capacity" -le 10 ]; then
    text="$capacity%"
    class="critical"
elif [ "$capacity" -le 30 ]; then
    text="$capacity%"
    class="low"
elif [ "$capacity" -le 60 ]; then
    text="$capacity%"
    class="medium"
else
    text="\udb85\udfe2 $capacity%"
    class="high"
fi

printf '{"text": "%s","class": "%s"}\n' "$text" "$class"
# Conservation mode - \udb84\ude11
# \udb85\udfe2