#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

chomp(my $names = join '', <>);
my @array =split(/\^/, $names);

say join("\n", sort { length($a) <=> length($b) } @array), "\n";
