#!/usr/bin/perl
use strict;
use warnings;

my %number_to_str_map = (
    1  => "one",
    2  => "two",
    3  => "three",
    4  => "four",
    5  => "five",
    6  => "six",
    7  => "seven",
    8  => "eight",
    9  => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "quarter",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "half"
);

sub convertTimeToStr {
    my ($hour, $minute, $separator) = @_;
    my $result;

    my $minutes_word = $minute == 1 ? " minute" : " minutes";
    if ($minute == 15 || $minute == 30) {
        $minutes_word = "";
    }

    if ($minute % 10 == 0 || $minute < 20) {
        $result = $number_to_str_map{$minute} . $minutes_word . $separator . $number_to_str_map{$hour};
    }
    else {
        $result = $number_to_str_map{int($minute / 10) * 10} . " " . $number_to_str_map{$minute % 10}
            . $minutes_word . $separator . $number_to_str_map{$hour};
    }
    $result;
}

sub timeInWords {
    my ($hour_str, $minute_str) = @_;
    my $result;

    my $hour = int($hour_str);
    my $minute = int($minute_str);

    if ($minute == 0) {
        $result = $number_to_str_map{$hour} . " o' clock";
    }
    elsif ($minute >= 1 && $minute <= 30) {
        $result = convertTimeToStr($hour, $minute, " past ");
    }
    else {
        $minute = 60 - $minute;
        $hour++;
        $result = convertTimeToStr($hour, $minute, " to ");
    }
    $result;
}

open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

my $h = <>;
$h =~ s/\s+$//;

my $m = <>;
$m =~ s/\s+$//;

my $result = timeInWords $h, $m;

print $fptr "$result\n";

close $fptr;
