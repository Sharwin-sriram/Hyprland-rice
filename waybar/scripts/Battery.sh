capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$status" = "Charging" ]; then
    class="charging"
elif [ "$capacity" -le 10 ]; then
    class="critical"
elif [ "$capacity" -le 30 ]; then
    class="low"
elif [ "$capacity" -le 60 ]; then
    class="medium"
else
    class="high"
fi

printf '{"text": "%d","class": "%s"}\n' "$charge" "$class"
