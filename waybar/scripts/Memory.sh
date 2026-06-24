use=$(free -h | awk '/Mem/ {print $3}')
tot=$(free -h | awk '/Mem/ {print $2}')
pct=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')

icon=$'\uefc5'

printf '{"text":"%d%% %s","tooltip":"%s / %s"}\n' "$pct" "$icon" "$use" "$tot"