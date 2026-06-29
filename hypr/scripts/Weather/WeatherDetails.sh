source ~/.config/hypr/scripts/.env
# TODO: Implement a weather widget in lockscreen

LOCATION=$("$HOME/.config/hypr/scripts/Weather/Location.sh")

LAT=$(echo "$LOCATION" | jq -r '.loc' | cut -d',' -f1)
LON=$(echo "$LOCATION" | jq -r '.loc' | cut -d',' -f2)


WEATHER=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${OPENWEATHER_API_KEY}&units={metric}")

NAME=$(echo "$WEATHER" | jq -r '.name')
TEMP=$(echo "$WEATHER" | jq -r '.main' | jq -r '.temp' | cut -d'.' -f1)

echo $TEMP