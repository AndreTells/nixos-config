#!/bin/sh
condition=$(echo "$(wpctl get-volume @DEFAULT_SINK@ | sed 's/^[^:]*://' | sed 's/\[MUTED\]//') < 1.0" | bc)
if (( condition == 1)); then
  echo "test";
  wpctl set-volume @DEFAULT_SINK@ 5%+ ;
fi
