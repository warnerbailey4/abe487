#!usr/bin/env perl

use strict;
use warnings;

unless (@ARGV == 2) {
    die "please input two numbers\n";
}

my $first  = shift @ARGV;
my $second = shift @ARGV;

if ($first < 0 || $second < 0) {
    print STDERR "Please input two positive numbers\n";

}
elsif ($second == 0) {
    print STDERR "You canot divide by zero\n";
}
else {
    print $first/ $second, "\n";
}
