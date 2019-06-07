#!/usr/bin/perl
use strict;
use warnings;

sub square {
    my ($x, $y) = @_;
    $x * $y;
}

chomp(my $x = <>);
chomp(my $y = <>);

print "Square is: ", square($x, $y), "\n";
