#!/usr/bin/env perl

use strict;
use warnings;

my ($f1, $f2) = @ARGV;

open my $f1_fh, "<", $f1; 
or die "Please provide a valid file";

open my $f2_fh, "<" $f2;
or die "Please provide two valid input files";

while (my $words = <$f1_fh>) {
    chomp $words;
#$word =~ s/[^A-Za-z0-9]//g;

