#!/usr/bin/perl
use strict;
use warnings;
use utf8;
binmode(STDOUT, "encoding(UTF-8)");

my %substitutions = (
    a  => "Λ",
    b => "β",
    c => "¢",
    d => "∂",
    e => "Ꮛ",
    f => "∫",
    g => "9",
    h => "ђ",
    i => "¡",
    j => "🅹",
    k => "ӄ",
    l => "\\|",
    m => "爪",
    n => "η",
    o => "0",
    p => "ρ",
    q => "ᑫ",
    r => "⸀",
    s => "5",
    t => "†",
    u => "µ",
    v => "√",
    w => "ᗯ",
    x => "乂",
    y => "¥",
    z => "乙",
    " " => "  "
);

my %launchers = (
    dmenu => "dmenu -b -i -nb '#000000' -sf '#000000' -sb '#ee0000' -nf '#ca257f'",
    rofi => "rofi -dmenu -i -p leetspeak",
);
my $launcher = $launchers{( $ARGV[0] )};

my $inputText = `echo '' | ${launcher}`;

foreach my $letter (keys %substitutions) {
    $inputText =~ s/$letter/$substitutions{$letter}/g;
}

chomp $inputText;
print $inputText;

system( "echo -n ${inputText} | xclip -selection c" )
