source ~/.config/hypr/scripts/Weather/Location.sh

TEMP=$(echo "$WEATHER" | jq -r '.main' | jq -r '.temp' | cut -d'.' -f1)

echo "$TEMP°C"