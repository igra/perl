#!/usr/bin/perl

use strict;
use warnings;

# Complete the plusMinus function below.
sub plusMinus {
   my $arr = shift;
   my @arr = @{$arr};

   my $positive = 0;
   my $negative = 0;
   my $neutral = 0;

   for my $val(@arr) {
      if ($val == 0) {
        $neutral++;
      } elsif ($val > 0) {
        $positive++;
      } else {
        $negative++;
      }
   }

   my $total = scalar @arr;
   print divide($positive, $total), " ",
         divide($negative, $total), " ",
         divide($neutral, $total), "\n";
}

sub divide {
  my ($val, $total) = @_;
  return sprintf("%.6f", ($val / $total));
}

my $n = <>;
$n =~ s/\s+$//;

my $arr = <>;
$arr =~ s/\s+$//;
my @arr = split /\s+/, $arr;

plusMinus \@arr;