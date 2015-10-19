#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $seq      = shift or die "Please provide a sequence.\n";
my $kmersize = shift || 3;

if (-e $seq) {
    open my $fh, '<', $seq;
    $seq = join '', <$fh>;
}

my $seq_len = length($seq);
unless ($seq_len >= $kmersize) {
    die "Cannot get any $kmersize mers from a sequence of length $seq_len\n";
}

my $nummers = $seq_len - $kmersize + 1;

if (!$seq) {
    die "Zero-length sequence.\n";
}
my %unique;
for (my $i = 0; $i < $nummers; $i++) {
    my $kmer = substr($seq, $i, $kmersize);
    $unique{$kmer}++ 
}
my $count = scalar(keys %unique);
my $single = scalar(grep{$_ == 1} values %unique);

my $fmt = "%-15s %10s\n";
printf $fmt, "Sequence length", length($seq);
printf $fmt, "Mer size", $kmersize;
printf $fmt, "Number of kmers", $nummers;
printf $fmt, "Unique kmers", $count;
printf $fmt, "Num. singletons", $single;

if ($single < $count) {
    say "Most abundant";
    my $i = 0;
    foreach my $kmer (
        sort {
            $unique{$b} <=> $unique{$a} || $a cmp $b
        } 
        keys %unique
    ) {
        my $count = $unique{$kmer};
        if ($count >1) {
            $i++;
            last if $i > 10;
            say $kmer, ": ", $count;
        }
    }
}
