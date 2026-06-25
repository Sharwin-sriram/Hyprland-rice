duration=$(playerctl metadata --format "{{ duration(position) }} / {{ duration(mpris:length) }}" 2>/dev/null)

if [[ -z "$duration" ]]; then
    exit 0
fi

echo "$duration"