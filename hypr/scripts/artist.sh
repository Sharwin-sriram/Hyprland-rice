artist=$(playerctl metadata artist 2>/dev/null)

if [[ -z "$artist" ]]; then
    exit 0
fi

echo "$artist"