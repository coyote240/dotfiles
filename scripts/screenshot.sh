#!/usr/bin/env bash
#
# Screenshot dmenu script
#
# This script was written to be keybound when using dmenu,
# specifically within the i3 window manager.
#
# eg. to bind to PRINT SCREEN
# bindsym 0xff61 exec screenshot.sh
# 
# This script depends on dmenu, slop, maim and display

if [[ ! `which dmenu` ]]; then
  echo "This script depends on dmenu"
  exit 1
fi

if [[ ! `which slop` ]]; then
  echo "This script depends on slop"
  exit 1
fi

if [[ ! `which maim` ]]; then
  echo "This script depends on maim"
  exit 1
fi

if [[ ! `which display` ]]; then
  echo "This script depends on display"
  exit 1
fi

PICTURES="${HOME}/Pictures"
FILE="${PICTURES}/$(date '+%Y-%m-%d-%H:%M:%S').png"

function region() {
  REGION=$(slop -q) || exit 1
  read -r G < <(echo $REGION)
  import -window root -crop $G $FILE
}

function window() {
  WINDOW=$(xdotool getactivewindow)
  maim --window $WINDOW $FILE
}

function screen() {
  maim $FILE
}

OPTIONS=$(cat << 'EOF'
Region
Window
Screen
EOF
)

SELECTED=$(echo "${OPTIONS}" | dmenu -i -p "Screenshot: ")

case $SELECTED in
  Region)
    region
    display $FILE ;;
  Window)
    window
    display $FILE ;;
  Screen)
    screen
    display $FILE ;;
esac

