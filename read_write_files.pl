#!/usr/bin/perl
use strict;
use warnings;

open my $input_file, "<", "input1.txt"
    or die "Cannot open the file: input.txt\n";

my $line_counter = 0;
while (<$input_file>) {
    chomp;
    print ++$line_counter, ": ", $_, "\n";
}

exit(0);