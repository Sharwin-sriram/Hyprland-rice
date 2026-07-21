reload() {
  pkill -f hyprpaper
  hyprpaper & disown
}
