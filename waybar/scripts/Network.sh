ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
strength=$(awk 'NR==3 {print int($3 * 100 / 70)}' /proc/net/wireless)

if [ -z "$ssid" ]; then
    text="Disconnected"
    class="disconnected"
elif [ "$strength" -ge 75 ]; then
    text="$ssid"
    class="excellent"
elif [ "$strength" -ge 50 ]; then
    text="$ssid"
    class="good"
elif [ "$strength" -ge 25 ]; then
    text="$ssid"
    class="weak"
else
    text="$ssid $strength%"
    class="poor"
fi

printf '{"text":"%s","class":"%s"}\n' "$text" "$class"