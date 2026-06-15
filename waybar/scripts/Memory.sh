use=$(free -h | awk '/Mem/ {print $3}' | tr -d 'Gi')
tot=$(free -h | awk '/Mem/ {print $2}' | tr -d ''Gi)
printf '{"text":"%sGB/%sGB"}\n' "$use" "$tot"