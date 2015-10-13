#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";

if (scalar (@ARGV) != 2) {
    die "Please provide two sequences.\n";
}

my ($seq1, $seq2) = @ARGV;

if (length($seq1) ne length($seq2)) {
    die "Please ensure the sequences are the same length.";
}

my $num_snps;

for (my $i=0; $i<length($seq1); $i++){
    my $s1 = substr $seq1, $i, 1;
    my $s2 = substr $seq2, $i, 1;   
    if ($s1 ne $s2) {   
        $num_snps++;
        say "Pos ", $i + 1,": ", $s1, " => ", $s2;
    }
}   
 
say "Found $num_snps SNPs.";
