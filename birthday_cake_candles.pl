#!/usr/bin/perl
use strict;
use warnings;

# Complete the birthdayCakeCandles function below.
sub birthdayCakeCandles {
    my $candles_height = shift;
    my @candles_height = @{$candles_height};

    my $max_height = 0;
    my $number_of_max_occurences = 0;

    for my $height(@candles_height) {
        if ($height > $max_height) {
            $max_height = $height;
            $number_of_max_occurences = 1;
        } elsif ($height == $max_height) {
            $number_of_max_occurences++;
        }
    }

    $number_of_max_occurences;
}

open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

my $ar_count = <>;
$ar_count =~ s/\s+$//;

my $ar = <>;
$ar =~ s/\s+$//;
my @ar = split /\s+/, $ar;

my $result = birthdayCakeCandles \@ar;

print $fptr "$result\n";

close $fptr;
