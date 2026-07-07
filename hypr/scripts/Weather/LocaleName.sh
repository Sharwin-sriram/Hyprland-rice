cache='/tmp/weatherInfo.json'

STATE=$(jq -r '.state' "$cache")
DISTRICT=$(jq -r '.district' "$cache")

echo "$DISTRICT, $STATE"