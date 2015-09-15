#!/usr/bin/perl

use strict;
use warnings;

my $string1 = shift(@ARGV);
my $string2 = shift(@ARGV);

if (lc($string1) eq lc($string2)) {
	print "same names";
} else {
	print "different\n";
}
