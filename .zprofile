#!/bin/bash
export LANG=C

# startx
if [ "$(tty)" = "/dev/tty1" ]; then
       exec startx
fi
