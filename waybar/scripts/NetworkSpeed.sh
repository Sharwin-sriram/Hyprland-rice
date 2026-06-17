INTERFACE="wlp4s0"

SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
if [ -z "$SSID" ]; then
    printf '{"text":"","tooltip":"Disconnected","class":"disconnected"}\n'
    exit 0
fi

RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
RX_KB=$(( (RX2 - RX1) / 1024 ))
TX_KB=$(( (TX2 - TX1) / 1024 ))

format_speed() {
    local kb=$1
    if [ "$kb" -ge 1024 ]; then
        awk "BEGIN {printf \"%.1f MB/s\", $kb / 1024}"
    else
        echo "${kb} KB/s"
    fi
}

RX_DISPLAY=$(format_speed $RX_KB)
TX_DISPLAY=$(format_speed $TX_KB)

TOOLTIP="↓${RX_DISPLAY} ↑${TX_DISPLAY}"
TEXT="↓${RX_DISPLAY}"
printf '{"text":"%s","tooltip":"%s","class":"speed"}\n' "$TEXT" "$TOOLTIP"