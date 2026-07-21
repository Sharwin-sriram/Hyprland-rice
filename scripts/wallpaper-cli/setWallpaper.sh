# path = $HOME/Wallpapers/anime_girl.jpg
# path = $HOME/Wallpapers/goods/The_Crew_2_Artwork.jpeg
# path = $HOME/Wallpapers/firewatch_sunset.jpg
# path = $HOME/Wallpapers/goods/Diver_and_the_deep_Kraken.jpg
# path = $HOME/Wallpapers/default_wallpaper.png
# path = $HOME/Wallpapers/goods/When-tomorrow-comes.jpg
# path = $HOME/Wallpapers/into_the_spider_verse.jpg
# path = $HOME/Wallpapers/goods/Quiet_moment.jpg
# path = $HOME/Wallpapers/goods/pantone_color_of_the_year_2022.png
# path = $HOME/Wallpapers/goods/8-bit-city.jpg
# path = $HOME/Wallpapers/goods/Sierra-color-splash.jpg
# path = $HOME/Wallpapers/Twitter/20250816_090432.jpg
# path = $HOME/Wallpapers/fubuki-kancolle-a1.jpg
source ~/.config/scripts/wallpaper-cli/hyprpaperLocation.sh 

loc=$(echo "$HOME/.config/scripts/wallpaper-cli/hyprpaperLocation.sh")

wallpaperSet() {
  directory=$(echo "$1")
  if [[ ! -f "$hyprpaper" ]]; then
    echo "Invalid hyprpaper path - $hyprpaper"
    exit 1
  fi
  sed -i "3s|.*|    path = $directory|" "$hyprpaper"
  wallust run "$directory" > /dev/null
  hyprctl hyprpaper wallpaper eDP-1,"$directory"
}

change_hyprpaper_location() {
  path=$(echo "$1")
  sed -i "1s|.*|location=$(echo "$path")|" "$loc"
}

get_hyprpaper_location() {
  echo "current hyprpaper location: $hyprpaper"
}