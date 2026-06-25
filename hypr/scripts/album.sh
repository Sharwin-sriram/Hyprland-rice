album=$(playerctl metadata album)

if [[ album == "No players found" ]]; then
    exit 0
fi

echo "$album"