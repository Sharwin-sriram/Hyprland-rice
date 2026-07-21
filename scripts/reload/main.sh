# simple cli tool to restart apps

app="$1"
restart() {
  pkill -f "$app"

  # wait until it's actually gone
  while pgrep -f "$app" > /dev/null; do
    sleep 0.1
  done

  setsid "$app" > /dev/null 2>&1 &
}

restart
