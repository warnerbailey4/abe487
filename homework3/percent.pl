#!/usr/bin/perl
use strict;
use warnings;

my $x = shift(@ARGV);
my $y = shift(@ARGV);

if (($x + $y) == 0) {
	print "We cannot divide by zero \n";
} else {
	printf "%0.2f%%\n", 100 * ($x/($x + $y)), "\n";
}

