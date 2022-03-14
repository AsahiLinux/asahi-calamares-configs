#!/bin/sh


width=$(xdpyinfo 2>&1 | grep dimens | awk '{ print $2 }' | cut -dx -f1)
echo "Screen width: $width"
if [ "$width" -gt 2048 ]; then
    xrandr --dpi 144
fi

kwin_x11 &

sleep 0.2

imv -f /usr/share/wallpapers/Next/contents/images/5120x2880.jpg -c 'scaling crop' &

sleep 0.2

xinput set-prop "pointer:Apple Internal Keyboard / Trackpad" "libinput Natural Scrolling Enabled" 1

calamares && systemctl disable calamares.service
