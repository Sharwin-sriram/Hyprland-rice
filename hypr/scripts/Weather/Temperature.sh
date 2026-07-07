cache='/tmp/weatherInfo.json'

TEMP=$(jq -r '.temp' "$cache")

echo "$TEMP°C"