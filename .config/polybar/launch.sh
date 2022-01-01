#!/bin/bash

######################
# Kill programs used by modules 
#
# hideit
ps -ef | grep hideIt | grep -v grep | awk '{print $2}' | xargs kill
#

######################
# Kill polybar instances
#
killall -q polybar
#
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

######################
# Launch polybar(s)
#
polybar paige &
#
#polybar pc_vnc_landscape -r -l warning &
#
# Wait a moment for the bar(s) to set up
sleep 3


######################
# Launch programs used by modules
#
~/.config/polybar/scripts/hideIt.sh -r 0x0+1920+1 -N '^polybar-paige_eDP-1$' -d top -p 5

######################
# Done!
#
echo "Bar launched!"
