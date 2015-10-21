#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $poem = shift or die "Please provide a FASTA file.\n";

open my $fh, '<', $poem;

my $count = 0;
while (my $line = <$fh>) {
    chomp ($line);
    
    if ($line =~ /^>(.+)/) {
        $count++;
        say "$count: $1";
    }
}
printf "Found $count sequence%s.\n", ($count == 1) ? '' : 's';

