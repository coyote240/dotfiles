#!/usr/bin/env bash
#
# Komputeko dmenu script
#
# This script uses the open-source Komputeko database of
# technical terms to provide a searchable menu of terms.
# A selected term will return the Esperanto equivalent
# to the user's keyboard.
#
# eg. to bind to $mod+t in the i3 window manager
# bindsym $mod+t exec komputeko.sh

if [[ ! `which jq` ]]; then
  echo "This script depends on jq"
  exit 1
fi

if [[ ! `which dmenu` ]]; then
  echo "This script depends on dmenu"
  exit 1
fi

DATA="${HOME}/bin/komputeko.json"

function wordlist() {
  jq -r '.words[].en[]?.word' ${DATA}
}

function get_word() {
  INPUT="$@"
  jq -r --arg word "${INPUT}" '.words[] | select(.en[]?.word == $word) | .eo[].word' ${DATA}
}

SELECTED=$(wordlist | dmenu -i -p "Komputeko: " -l 15)

echo $(get_word $SELECTED) | xclip -i -r -selection primary
