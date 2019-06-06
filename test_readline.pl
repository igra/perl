#!/usr/bin/perl
use strict;
use warnings;
use utf8;

print "Your name: ";
chomp(my $name = <STDIN>);

print "Your age: ";
chomp(my $age = <STDIN>);

print "Hello, ", $name, ". You are ", $age, " years old!", "\n";