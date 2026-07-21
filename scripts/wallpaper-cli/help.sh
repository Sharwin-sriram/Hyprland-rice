# TODO: Implement help
display_help() {
  if [[ "$1" == "" ]]; then
    help_all
  else
    help "$1"
  fi
}

help_all () {
  echo "all helps"
}

help () {
  echo "help subcommand $1"
}