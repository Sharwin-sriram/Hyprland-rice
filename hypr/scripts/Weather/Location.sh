source ~/.config/hypr/scripts/.env

LOCATION=$(curl -s "https://ipinfo.io/json")

LAT=$(echo "$LOCATION" | jq -r '.loc' | cut -d',' -f1)
LON=$(echo "$LOCATION" | jq -r '.loc' | cut -d',' -f2)

WEATHER=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${OPENWEATHER_API_KEY}&units={metric}")