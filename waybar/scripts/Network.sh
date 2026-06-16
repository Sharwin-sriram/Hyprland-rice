ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
strength=$(awk 'NR==3 {print int($3 * 100 / 70)}' /proc/net/wireless)

tooltip="$ssid"

[ ${#ssid} -gt 5 ] && ssid="${ssid:0:5}..."

if [ -z "$ssid" ]; then
    text="Disconnected \udb82\udd2e"
    class="disconnected"
    tooltip="Disconnected"
elif [ "$strength" -ge 75 ]; then
    text="\udb82\udd28"
    class="excellent"
elif [ "$strength" -ge 50 ]; then
    text="\udb82\udd25"
    class="good"
elif [ "$strength" -ge 25 ]; then
    text="\udb82\udd22"
    class="weak"
else
    text="\udb82\udd1f"
    class="poor"
fi

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$text" "$tooltip" "$class"