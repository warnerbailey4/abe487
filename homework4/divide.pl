#!usr/bin/perl                                                                                            

use strict;
use warnings;

my $num1 = shift;
my $num2 = shift;
my $divide = $num1 / $num2;

if (! defined $num1 or ! defined $num2) {
	print qq(Two numbers are required.\n);
} elsif ($num1 < 0 && $num2 < 0) {
	print qq(The numbers must be positive.\n);
}
