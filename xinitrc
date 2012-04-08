#bg
xsetroot -cursor_name left_ptr

#settings
xrdb -merge ~/.Xresources
setxkbmap -layout pl
feh --bg-fill feh --bg-fill /home/l1/Pictures/wallpapers/A_Flying_Tree_by_vladstudio.jpg

#apps
parcellite &
pulseaudio &
gnome-screensaver &

#urxvtd
urxvtd &

exec ck-launch-session xmonad
