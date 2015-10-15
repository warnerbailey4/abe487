#!/usr/bin/env perl

use strict;
use warnings;
use autodie; 
use feature 'say';
use Data::Dumper;

unless (@ARGV == 2) {
    die "Please provide two files.\n";
} 

my ($f1, $f2) = @ARGV;

open my $f1_fh, "<", $f1; 
open my $f2_fh, "<", $f2;

my %file1;
while (my $line = <$f1_fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words) {
        $word =~ s/[^A-Za-z0-9]//g;
        $file1{lc($word)} = 1;
    }
}

my %file2;
while (my $line = <$f2_fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words) {
        $word =~ s/[^A-Za-z0-9]//g;
        $file2{lc($word)} = 1;
    }
}
my $count = 0;
for my $word (sort keys %file1) {
    if (exists $file2{$word}) {
        say "$word";
        $count++;
    }
}
say "Found $count words in common.";
