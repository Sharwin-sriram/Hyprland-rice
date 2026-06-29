source ~/.config/hypr/scripts/Weather/Location.sh

CODE=$(echo "$WEATHER" | jq -r '.weather[0].icon')

ICO_PATH="/tmp/weather-ico.png"
rm -rf "$ICO_PATH"

URL="https://openweathermap.org/img/wn/${CODE}@2x.png"
curl -sL "$URL" -o "$ICO_PATH"