#!/bin/bash

title=$(playerctl metadata title 2>/dev/null)

if [[ -z "$title" ]]; then
    rm -f /tmp/spotify-albumart.png
    echo "Nothing's playing"
    exit 0
fi

# Truncate long titles
max=30
if [[ ${#title} -gt $max ]]; then
    title="${title:0:$max}..."
fi

echo "$title"