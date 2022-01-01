#!/usr/bin/perl

use strict;
use warnings;

my $hd_scan = (`smartctl --scan`);

my $result = (`sudo smartctl -a /dev/sda`);

print($result);
