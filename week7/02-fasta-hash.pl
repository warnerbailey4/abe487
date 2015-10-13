#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;


my $file = shift || 'Perl_V.genesAndSeq.txt';

my %seq;

open my $fh, '<', $file;

my $id = '';

while (my $line = <$fh>) {
    chomp $line;
    #my ($key, $value) = split /\t/, $line;
    #$hash{$key} = $value;
    #say "line ($line)";
    if (substr($line, 0, 1) eq '>') {
        $id = substr($line,1);
        $seq{$id} = 0;
    }
    else {
        $seq{$id} += length($line);
    }
}

for my $key (
    sort { $seq{$a} <=> $seq{$b} } 
    keys %seq
) {
    say "$key: $seq{$key}";
}
