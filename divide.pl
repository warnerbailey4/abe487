#!usr/bin/perl

use strict;
use warnings;

my $num1 = shift @ARGV;
my $num2 = shift @ARGV;

if (!$num1 > 0 or !$num2 > 0) {
	print qq(The numbers must be positive.\n)
} elsif (! $num2 = 0) {
	print qq(the divisor must be zero.\n);
}
