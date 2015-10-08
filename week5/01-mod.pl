#!/usr/bin/env perl

use strict;
use warnings;

if (!@ARGV) {
    die "Please provide a list of numbers.\n";
} 

my @even;

for my $num (@ARGV){
    #print "Number: $num\n";
    #print $num%2, "\n";
    if ($num%2 == 0) {
        push @even, $num;
    }    
}
print "evens = ", join (', ', @even),"\n";
