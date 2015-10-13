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

my $number = 0;
foreach my $place (sort {uc$a cmp uc$b} keys %places) {
    my $location = $places{$place};  
    my $new_numbers = ++$number; 
    say "$new_numbers: $place, $location";
};
