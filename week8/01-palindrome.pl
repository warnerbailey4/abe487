#!/usr/bin/ env perl

use strict;
use warnings;
use feature 'say';

my $line = shift or die "Please provide a word or phrase.\n";

chomp($line);
$line =~ s/[^A-Za-z0-9]//g;

if (uc $line eq reverse uc $line) {
    print "Yes\n";
}
else {
    print "No\n";
}

