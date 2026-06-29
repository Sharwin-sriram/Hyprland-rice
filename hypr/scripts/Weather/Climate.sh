source ~/.config/hypr/scripts/Weather/Location.sh

CLIMATE=$(echo "$WEATHER" | jq -r '.weather[0].main')

echo "$CLIMATE"