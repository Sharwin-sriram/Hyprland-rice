source ~/.config/hypr/scripts/Weather/Location.sh

STATE=$(echo "$LOCATION" | jq -r '.region')
DISTRICT=$(echo "$WEATHER" | jq -r '.name')

echo "$DISTRICT, $STATE"