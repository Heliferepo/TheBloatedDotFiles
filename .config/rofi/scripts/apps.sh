#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme themes/apps.rasi"

# Links
terminal=""
files="ﱮ"
editor=""
browser=""
music=""
discord="discord"

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music\n$discord"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
	i3-sensible-editor &
        ;;
    $files)
	nautilus
        ;;
    $editor)
        vim &
        ;;
    $browser)
        firefox &
        ;;
    $music)
        lxmusic &
        ;;
    $discord)
	discord &
	;;
esac

