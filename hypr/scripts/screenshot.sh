# TODO: FULLY IMPLEMENT A SCREENSHOT SCRIPT

slurpId=$(pidof slurp)

if ! region=$(slurp -w 0); then
    notify-send "Select a region"
    exit 1
fi

grim -g "$region" - | wl-copy
notify-send "screenshot" "copied to clipboard"

