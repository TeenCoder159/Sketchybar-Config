#!/bin/sh

# nothingness: 2C:BE:EB:0B:1E:0F

update() {
  if [ "$(blueutil --is-connected 2C:BE:EB:0B:1E:0F)" = "1" ]; then
    sketchybar --set "$NAME" icon=C icon.color=0xFFFCB103
  else
    sketchybar --set "$NAME" icon=D icon.color=0xff9b9b9b
  fi
}

mouse_clicked() {
  if [ "$(blueutil --is-connected 2C:BE:EB:0B:1E:0F)" = "1" ]; then
    osascript -e 'tell application "Spotify" to playpause'
    blueutil --disconnect 2C:BE:EB:0B:1E:0F 
  else
    blueutil --connect 2C:BE:EB:0B:1E:0F 
  fi

}


case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
