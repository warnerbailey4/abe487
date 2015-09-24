#!/usr/bin/perl 
use strict;   
use warnings;

my $infile = 'perl_III.fastq';
open my $in_fh, "<", $infile or die "I cannot read that file\n";


my $number_of_lines = 0;
my $total_length = 0;

while (my $line =<$in_fh>){
      chomp $line;
      $number_of_lines++;
      my $length = length ($line);
      my $total_length = $total_length += $length;
    }

my $average_length = $total_length/$number_of_lines;

print "Total number of lines =", $number_of_lines, "\n";
print "Total length = ", $total_length, "\n";
print "Average line length= ", $average_length, "\n"
