#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use XML::Simple;
use Data::Dumper;
binmode(STDOUT, "encoding(UTF-8)");

my $xml = new XML::Simple;
my $emojis = $xml->XMLin("/home/paige/.config/i3/emojils/en.xml");
my $annotations = $emojis->{annotations}->{annotation};

my %launchers = (
dmenu => "dmenu -b -i -nb '#000000' -sf '#000000' -sb '#ee0000' -nf '#ca257f'",
rofi => "rofi -dmenu -i -p emoji -matching normal -sort -sorting-method fzf",
);
my $launcher = $launchers{( $ARGV[0] )};

sub make_tagfile {
    open(my $out, ">",  "/home/paige/.config/i3/emojils/tags.txt") or die "Can't open output.txt: $!";
    for my $annotation (@$annotations) {
        my @content = split / \| /, $annotation->{'content'};
        my $cp = $annotation->{'cp'};
        for my $tag (@content) {
            print $out "$tag : ${cp}\n"
        }
    };
    `sort -uo tags.txt tags.txt`
};

my $emoji = `cat ~/.config/i3/emojils/tags.txt | ${launcher}`;
$emoji =~ s/.* : //g;
chomp $emoji;
system("echo -n ${emoji} | xclip -selection c")

# perl-xml-simple
# xclip
# https://github.com/unicode-org/cldr/blob/master/common/annotations/en.xml
