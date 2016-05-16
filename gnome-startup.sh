#!/bin/bash

printf "%s\n" "[$(date -Isec)] running $0" >> "$HOME/log/gnome-startup.log"

# disable past with middle mouse button
# cf. http://askubuntu.com/questions/4507/how-do-i-disable-middle-mouse-button-click-paste
xmodmap -e "pointer = 1 25 3 4 5 6 7 8 9"
