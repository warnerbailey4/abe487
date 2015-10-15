#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use feature 'say';
 
my %places = (
    Houston => 'TX',
    Chicago => 'IL',
    Doha => 'QA',
    Tucson => 'AZ',
);
print Dumper(\%places);

foreach my $place (sort {uc$a cmp $b} keys %places) {
    my $location = $places{$place};
    say " $place, $location";
};
