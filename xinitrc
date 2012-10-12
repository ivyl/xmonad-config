#bg
xsetroot -cursor_name left_ptr

#settings
xset -b
xrdb -merge ~/.Xresources
feh --bg-fill ~/.xmonad/background

#hide mouse coursor when it isn't used
unclutter &

#clipboard synchronization
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#dbus instance
eval `dbus-launch --sh-syntax --exit-with-session`

#fix java issues
wmname LG3D

#apps
start-pulseaudio-x11
urxvtd &

#WM name
wmname LG3D

#Keyboard layout
setxkbmap -layout pl
xmodmap ~/.xmonad/Xmodmap
[ -e ~/.Xmodmap_local ] && xmodmap ~/.Xmodmap_local

#disks automounting
udiskie &

xmonad
