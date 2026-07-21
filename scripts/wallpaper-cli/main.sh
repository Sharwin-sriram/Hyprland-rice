source ~/.config/scripts/wallpaper-cli/setWallpaper.sh
source ~/.config/scripts/wallpaper-cli/reload.sh
source ~/.config/scripts/wallpaper-cli/help.sh

args=$(echo "$#")
arg1=$(echo "$1")
arg2=$(echo "$2")

if [[ "$arg1" == "reload" && args -eq 1 ]]; then
  reload
elif [[ "$arg1" == "set" && args -eq 2 ]]; then
  wallpaperSet "$arg2"
elif [[ "$arg1" == "help" && args -le 2 ]]; then
  display_help "$arg2"
elif [[ "$arg1" == "change" && args -eq 2 ]]; then
	change_hyprpaper_location "$arg2"
elif [[ "$arg1" == "current" && args -eq 1 ]]; then
	get_hyprpaper_location
else
  echo "error: invalid option '$arg1'"
  # for arg in "$@"; do
    # echo "$arg"
  # done
	display_help
fi
