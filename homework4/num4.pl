#!/usr/bin/env perl 

use strict;   
use warnings;
use feature 'say';
use autodie;

my $infile = 'perl_III.fastq';
open my $in_fh, '<', $infile;

my $number_of_lines = 0;
my $total_length    = 0;

while (my $line = <$in_fh>) {
    chomp $line;
    $number_of_lines++;
    my $length = length($line);
    my $total_length = $total_length += $length;
}

my $average_length = $total_length / $number_of_lines;

say "Total number of lines =", $number_of_lines;
say "Total length = ",         $total_length;
say "Average line length= ",   $average_length;
