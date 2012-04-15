#bg
xsetroot -cursor_name left_ptr

#settings
xrdb -merge ~/.Xresources
setxkbmap -layout pl
xmodmap ~/.xmonad/Xmodmap
feh --bg-fill feh --bg-fill ~/.xmonad/background

#hide mouse coursor when it isn't used
unclutter &

#clipboard synchronization
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#dbus instance
eval `dbus-launch --sh-syntax --exit-with-session`

#apps
pulseaudio &
gnome-screensaver &
urxvtd &

exec ck-launch-session zsh -c "udiskie & xmonad"
