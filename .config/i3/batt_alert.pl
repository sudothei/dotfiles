#!/usr/bin/perl
#
# USAGE
#   perl batt_alert.pl [interval] [threshold]
#
#   interval: battery check frequency in seconds
#   threshold: batter level that triggers alert

use strict;
use warnings;

my $interval = $ARGV[0];
my $threshold = $ARGV[1];

sub check_charging {
    my $charging = (`cat /sys/class/power_supply/BAT0/status | tr -d '\n'`);
    if ($charging eq "Discharging") {
        return 1;
    }}

sub check_threshold {
    while (1) {
        my $capacity = (`cat /sys/class/power_supply/BAT0/capacity | tr -d '\n'`);
        if ($capacity <= $threshold) {
            return 1;
        }
    }
}

sub send_battery_alert {
    (`notify-send -u critical -c power_supply_low 'Low Battery!' 'Battery $threshold%! \n Please plug in charger.'`);
    for my $i (0 .. 9) {
        my $tone = 497 - ( $i * 32 );
        (`speaker-test -t sine -f $tone -l 1 & sleep .1 && kill -9 \$!`);
    }
}

for( ; ; ) {
    if (check_charging()) {
        if (check_threshold()) {
            send_battery_alert();
            while (check_charging()) {
                sleep 1;
            }
        }
    }
    sleep $interval;
}
