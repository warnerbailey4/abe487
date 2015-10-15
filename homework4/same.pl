#!/usr/bin/perl

use strict;
use warnings;

my $string1 = shift(@ARGV);
my $string2 = shift(@ARGV);

if ($string1 eq $string2) {
	print "same names";
} else {
	print "different\n";
}
