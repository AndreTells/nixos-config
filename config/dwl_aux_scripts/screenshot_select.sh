#!/bin/sh
mkdir -p ~/Pictures && grim -g "$(slurp)" - > ~/Pictures/screenshot$(date +'%Y-%m-%d-%H:%M%S').png
