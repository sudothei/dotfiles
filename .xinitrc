setxkbmap -option grp:alt_shift_toggle,caps:escape us,il                    
nice -n 15 batt_alert &
nice -n 15 ivrit_status &
dunst &
udiskie &
picom &
nice -n 15 xwinwrap -d -b -s -fs -st -sp -nf -ov -fdt -- gifview -w WID ~/Pictures/scene.gif -a
exec dwm
