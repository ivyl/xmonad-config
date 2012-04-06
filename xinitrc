#bg
xsetroot -cursor_name left_ptr

#settings
xrdb -merge ~/.Xresources
setxkbmap -layout pl
feh --bg-fill /home/l1/Pictures/Arch_Linux_Wallpaper_by_james66.jpg

#apps
parcellite &
pulseaudio &
gnome-screensaver &

exec ck-launch-session xmonad
