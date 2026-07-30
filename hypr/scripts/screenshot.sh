# TODO: FULLY IMPLEMENT A SCREENSHOT SCRIPT

slurpId=$(pidof slurp)
arg1=$(echo "$1")
echo "$1"

if [[ "$arg1" == "-fs" ]]; then
  grim - | wl-copy
  notify-send "screenshot" "copied to clipboard"
  exit 1
elif ! region=$(slurp -w 0); then
  notify-send "Select a region"
  exit 1
fi

grim -g "$region" - | wl-copy
notify-send "screenshot" "copied to clipboard"
