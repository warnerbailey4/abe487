#!/usr/bin/perl

use strict;
use warnings;

while (my $line = <>) {
    chomp($line);
    
    $line = uc $line;
    my $nobody_index   = index($line,'NOBODY');
    my $somebody_index = index($line,'SOMEBODY');
   
 if ($nobody_index >= 0) {
    warn("Nobody is found on this character: $nobody_index.\n");
    }
   
 if ($somebody_index >= 0) {
    warn("Somebody is found on this character: $somebody_index.\n");
    }
}
