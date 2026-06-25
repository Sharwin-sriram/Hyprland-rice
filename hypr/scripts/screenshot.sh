# TODO: FULLY IMPLEMENT A SCREENSHOT SCRIPT

ss=$(grim -g "$(slurp -w 0)" - | wl-copy)
if [$ss -e "selection cancelled"]
    notify-send "Screenshot cancelled" "Select a region"
fi