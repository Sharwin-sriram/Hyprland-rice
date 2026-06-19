use=$(free -h | awk '/Mem/ {print $3}' | tr -d 'Gi')
tot=$(free -h | awk '/Mem/ {print $2}' | tr -d 'Gi')
pct=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')

icon=$'\uefc5'

printf '{"text":"%d%% %s","tooltip":"%sGiB / %sGiB"}\n' "$pct" "$icon" "$use" "$tot"