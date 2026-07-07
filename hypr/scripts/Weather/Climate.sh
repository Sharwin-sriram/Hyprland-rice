cache='/tmp/weatherInfo.json'

CLIMATE=$(jq -r '.climate' "$cache")

case "$CLIMATE" in
    Clouds) CLIMATE="Cloudy" ;;
    Rain)   CLIMATE="Rainy"  ;;
    Clear)  CLIMATE="Sunny"  ;;
esac

echo "$CLIMATE"