#!/usr/bin/bash

BACKGROUND=~/.cache/i3lock.png

import -screen -window root tif:- | convert tif:- -depth 8 -blur 64x32 $BACKGROUND
i3lock -i $BACKGROUND
