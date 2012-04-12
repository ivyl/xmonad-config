#bg
xsetroot -cursor_name left_ptr

#settings
xrdb -merge ~/.Xresources
setxkbmap -layout pl
feh --bg-fill feh --bg-fill ~/.xmonad/background

#hide mouse coursor when it isn't used
unclutter &

#clipboard synchronization
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#auto mount devices
udiskie &

#apps
pulseaudio &
gnome-screensaver &
urxvtd &

exec ck-launch-session xmonad
