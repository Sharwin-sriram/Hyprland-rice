source ~/.config/hypr/scripts/Weather/Location.sh
DEST='/tmp/weatherInfo.json'

STATE=$(echo "$LOCATION" | jq -r '.region')
DISTRICT=$(echo "$WEATHER" | jq -r '.name')
CLIMATE=$(echo "$WEATHER" | jq -r '.weather[0].main')
TEMP=$(echo "$WEATHER" | jq -r '.main' | jq -r '.temp' | cut -d'.' -f1)

json_string=$(
  jq --null-input \
    --arg state "${STATE}" \
    --arg district "${DISTRICT}" \
    --arg climate "${CLIMATE}" \
    --arg temp "${TEMP}" \
    '{state: $state, district: $district, climate: $climate, temp: $temp}'
)

echo "$json_string" > "${DEST}"