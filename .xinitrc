#!bin/sh

xrdb merge ~/.Xresources
xsetroot -solid "#3E5059"
feh --bg-fill ~/Backgrounds/bkg.jpg

# xcalib ~/colorprofiles/Color\ LCD-F466F621-B5FA-04A0-0800-CFA6C258DECD.icc

# set screen for mbp@2x
# xrandr --output eDP-1 --mode 2880x1800 --dpi 180

# /etc/profile.d/locale.sh

exec i3

# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus

# You probably need to do this too:
# export SSH_AUTH_SOCK
# export GPG_AGENT_INFO

true
