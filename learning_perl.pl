#!/usr/bin/perl
use strict;
use warnings;

sub say_hello {
  my ($name) = @_;
  print "Hej, ", $name, "\n";
}

for my $i (1..10) {
  say_hello($i);
}

my @nums = (31, 32, 33);
for my $num (@nums) {
  print " ", $num, " ";
}
print "\n";

for (my $i = 0; $i < 10; $i++) {
  print "i :" , $i, "\n";
}
