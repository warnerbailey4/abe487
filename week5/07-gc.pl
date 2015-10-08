#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";

if (!@ARGV) {
    die "Please provide two sequences.\n";
}
my @ucase = map { uc } @ARGV;

for my $sequence (@ucase) {
    my @sequence = split (//, $sequence);
    my $total_length = 0;
    my $GC_count = 0;

    foreach my $nucl (@sequence){
        if ( ($nucl eq "C") or ( $nucl eq "G") ){
            $GC_count++;
        }
        $total_length++
    }

    say "------";
    say "Seq :", @ARGV;
    say "Length: ", $total_length;
    say "#GC :", $GC_count;   
    my $percent_GC = ($GC_count/$total_length)*100;
    say "%GC :", $percent_GC;
}
