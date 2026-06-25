#!/bin/bash

ART_PATH="/tmp/spotify-albumart.png"

fetchArt() {
    url=$(playerctl metadata mpris:artUrl 2>/dev/null)

    if [[ -z "$url" ]]; then
        return
    fi

    if [[ "$url" == http* ]]; then
        curl -s "$url" -o "$ART_PATH"
    elif [[ "$url" == file://* ]]; then
        cp "${url#file://}" "$ART_PATH"
    fi
}

# Fetch immediately on start
fetchArt

# Watch for track changes
playerctl --follow metadata mpris:artUrl 2>/dev/null | while read -r _; do
    fetchArt
done