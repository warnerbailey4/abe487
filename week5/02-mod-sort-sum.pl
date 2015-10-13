#!/usr/bin/env perl

use strict;
use warnings;

if (!@ARGV) {
    die "Please provide a list of numbers.\n";
}

my $esum = 0;
my $osum = 0;

for my $num (@ARGV){
    #print "Number: $num\n";
    #print $num%2, "\n";
    if ($num%2 == 0) {
         #$esum = $esum + $num;
         $esum += $num;
    } 
    else {
         $osum = $osum + $num;
    }
}
print "sum evens = $esum \n";
print "sum odds = $osum \n";
