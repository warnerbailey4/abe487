#!/usr/bin/perl
use strict;
use warnings;

my $first = shift(@ARGV);
my $second = shift(@ARGV);

if (($first cmp $second) > 0) { #if >0 then the value on the right is higher
	print "$second $first\n" 
} else {
	print "$first $second\n";
}
