#!/usr/bin/env perl

use strict;
use warnings;
use autodie; 
use feature 'say';
use Data::Dumper;

unless (@ARGV == 2) {
    die "Please provide two input files to read.\n";
} 

my ($f1, $f2) = @ARGV;

open my $f1_fh, "<", $f1; 
open my $f2_fh, "<", $f2;

my %file1;
while (my $line = <$f1_fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words) {
        say "before ($word)";
        $word =~ s/[^A-Za-z0-9]//g;
        say "after ($word)";
        $file1{uc($word)} = 1;
    }
}
say Dumper (\%file1);       

my %file2;
while (my $line = <$f2_fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words) {
        say "before ($word)";
        $word =~ s/[^A-Za-z0-9]//g;
        say "after ($word)";
        $file2{uc($word)} = 1;
    }
}
say Dumper (\%file2);

#while ($file1 eq $file2) {
 #   say "$file1\n";
#}     
#while (exists $file1{$file2}) {
#    say "$file1\n";
#}   

 
