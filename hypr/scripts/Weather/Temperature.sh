source ~/.config/hypr/scripts/Weather/Location.sh

TEMP=$(echo "$WEATHER" | jq -r '.main' | jq -r '.temp' | cut -d'.' -f1)
CLIMATE=$(echo "$WEATHER" | jq -r '.weather[0].main')

echo "$CLIMATE, $TEMP°C"